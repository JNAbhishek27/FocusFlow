import 'package:flutter/material.dart';
import 'package:focus_flow_client/focus_flow_client.dart';
import '../client.dart';
import '../widgets/stat_metric_card.dart';
import '../widgets/subject_badge.dart';
import '../widgets/task_item_tile.dart';
import '../widgets/add_task_dialog.dart';
import '../widgets/add_subject_dialog.dart';
import '../widgets/pomodoro_timer_dialog.dart';

class PlannerDashboardScreen extends StatefulWidget {
  final Future<void> Function()? onSignOut;
  const PlannerDashboardScreen({super.key, this.onSignOut});

  @override
  State<PlannerDashboardScreen> createState() => _PlannerDashboardScreenState();
}

class _PlannerDashboardScreenState extends State<PlannerDashboardScreen> {
  PlannerDashboardSummary? _summary;
  List<StudySubject> _subjects = [];
  List<StudyTask> _tasks = [];
  List<FocusSession> _recentSessions = [];

  int? _selectedSubjectFilter;
  bool? _selectedCompletionFilter = false; // default show pending
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  Future<void> _loadAllData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final summaryFuture = client.dashboard.getSummary();
      final subjectsFuture = client.subject.getSubjects();
      final tasksFuture = client.task.getTasks(
        subjectId: _selectedSubjectFilter,
        isCompleted: _selectedCompletionFilter,
      );
      final sessionsFuture = client.focusSession.getRecentSessions(limit: 10);

      final results = await Future.wait([
        summaryFuture,
        subjectsFuture,
        tasksFuture,
        sessionsFuture,
      ]);

      setState(() {
        _summary = results[0] as PlannerDashboardSummary;
        _subjects = results[1] as List<StudySubject>;
        _tasks = results[2] as List<StudyTask>;
        _recentSessions = results[3] as List<FocusSession>;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '$e';
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleTask(StudyTask task) async {
    try {
      await client.task.toggleTaskCompletion(task.id!);
      await _loadAllData();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating task: $e')),
      );
    }
  }

  Future<void> _deleteTask(StudyTask task) async {
    try {
      await client.task.deleteTask(task.id!);
      await _loadAllData();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting task: $e')),
      );
    }
  }

  Future<void> _deleteSubject(StudySubject subject) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Delete ${subject.name}?'),
        content: const Text(
          'This will also delete all tasks and focus history linked to this subject.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await client.subject.deleteSubject(subject.id!);
        if (_selectedSubjectFilter == subject.id) {
          _selectedSubjectFilter = null;
        }
        await _loadAllData();
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting subject: $e')),
        );
      }
    }
  }

  void _openTimer({StudyTask? task}) {
    StudySubject? subject;
    if (task != null) {
      subject = _subjects.cast<StudySubject?>().firstWhere(
        (s) => s?.id == task.subjectId,
        orElse: () => null,
      );
    }

    showDialog(
      context: context,
      builder: (ctx) => PomodoroTimerDialog(
        initialTask: task,
        initialSubject: subject,
        onSessionSaved: _loadAllData,
      ),
    );
  }

  void _openAddTaskDialog() {
    if (_subjects.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one subject first!')),
      );
      _openAddSubjectDialog();
      return;
    }

    showDialog(
      context: context,
      builder: (ctx) => AddTaskDialog(
        subjects: _subjects,
        selectedSubjectId: _selectedSubjectFilter,
        onTaskAdded: _loadAllData,
      ),
    );
  }

  void _openAddSubjectDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AddSubjectDialog(
        onSubjectAdded: _loadAllData,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF11141C)
          : const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.psychology_rounded,
                color: Colors.blueAccent,
                size: 24,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'FocusFlow',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh from Serverpod',
            onPressed: _loadAllData,
          ),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            ),
            onPressed: () => _openTimer(),
            icon: const Icon(Icons.timer_rounded, size: 18),
            label: const Text('Start Focus'),
          ),
          const SizedBox(width: 8),
          if (widget.onSignOut != null)
            IconButton(
              icon: const Icon(Icons.logout_rounded),
              tooltip: 'Sign Out',
              onPressed: widget.onSignOut,
            ),
          const SizedBox(width: 12),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.cloud_off_rounded,
                      size: 48,
                      color: Colors.redAccent,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Connection Error with Serverpod Backend',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(_errorMessage!, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: _loadAllData,
                      child: const Text('Retry Connection'),
                    ),
                  ],
                ),
              ),
            )
          : RefreshIndicator(
              onRefresh: _loadAllData,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dashboard Metrics Grid
                    if (_summary != null) ...[
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final width = constraints.maxWidth;
                          final crossAxisCount = width > 900
                              ? 4
                              : width > 550
                              ? 2
                              : 1;

                          return GridView.count(
                            crossAxisCount: crossAxisCount,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            childAspectRatio: width > 900 ? 1.6 : 1.8,
                            children: [
                              StatMetricCard(
                                title: 'Total Study Time',
                                value: '${_summary!.totalFocusMinutes}m',
                                subtitle: 'All-time',
                                icon: Icons.access_time_filled_rounded,
                                accentColor: Colors.blueAccent,
                              ),
                              StatMetricCard(
                                title: 'Today Focus Time',
                                value: '${_summary!.todayFocusMinutes}m',
                                subtitle: 'Goal: 120m',
                                icon: Icons.local_fire_department_rounded,
                                accentColor: Colors.deepOrangeAccent,
                              ),
                              StatMetricCard(
                                title: 'Tasks Completed',
                                value: '${_summary!.completedTasks}',
                                subtitle: '${_summary!.pendingTasks} remaining',
                                icon: Icons.task_alt_rounded,
                                accentColor: Colors.teal,
                              ),
                              StatMetricCard(
                                title: 'Avg. Productivity',
                                value: '${_summary!.averageProductivityScore}★',
                                subtitle: '5-star scale',
                                icon: Icons.star_rounded,
                                accentColor: Colors.amber,
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 28),
                    ],

                    // Subjects Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Study Subjects',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: _openAddSubjectDialog,
                          icon: const Icon(Icons.add_rounded, size: 18),
                          label: const Text('New Subject'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ChoiceChip(
                            label: const Text('All Subjects'),
                            selected: _selectedSubjectFilter == null,
                            onSelected: (sel) {
                              if (sel) {
                                setState(() => _selectedSubjectFilter = null);
                                _loadAllData();
                              }
                            },
                          ),
                          const SizedBox(width: 8),
                          ..._subjects.map((sub) {
                            final isSelected = _selectedSubjectFilter == sub.id;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: InputChip(
                                avatar: Icon(
                                  SubjectBadge.getIconData(sub.iconName),
                                  size: 14,
                                  color: isSelected
                                      ? Colors.white
                                      : SubjectBadge.parseHexColor(
                                          sub.colorHex,
                                        ),
                                ),
                                label: Text(sub.name),
                                selected: isSelected,
                                onSelected: (sel) {
                                  setState(() {
                                    _selectedSubjectFilter = sel
                                        ? sub.id
                                        : null;
                                  });
                                  _loadAllData();
                                },
                                onDeleted: () => _deleteSubject(sub),
                                deleteIconColor: isSelected
                                    ? Colors.white70
                                    : Colors.grey,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Tasks Section Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Study Tasks',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            SegmentedButton<bool?>(
                              segments: const [
                                ButtonSegment(
                                  value: false,
                                  label: Text('Pending'),
                                ),
                                ButtonSegment(value: true, label: Text('Done')),
                                ButtonSegment(value: null, label: Text('All')),
                              ],
                              selected: {_selectedCompletionFilter},
                              onSelectionChanged: (val) {
                                setState(() {
                                  _selectedCompletionFilter = val.first;
                                });
                                _loadAllData();
                              },
                            ),
                          ],
                        ),
                        FilledButton.icon(
                          onPressed: _openAddTaskDialog,
                          icon: const Icon(Icons.add_task_rounded, size: 18),
                          label: const Text('Add Task'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // Tasks List
                    if (_tasks.isEmpty)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF1E2330)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.checklist_rtl_rounded,
                              size: 48,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _selectedCompletionFilter == true
                                  ? 'No completed tasks yet. Finish a focus session to complete tasks!'
                                  : 'No pending study tasks! Click "Add Task" to plan your session.',
                              style: TextStyle(color: Colors.grey.shade600),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _tasks.length,
                        itemBuilder: (context, index) {
                          final task = _tasks[index];
                          final sub = _subjects
                              .cast<StudySubject?>()
                              .firstWhere(
                                (s) => s?.id == task.subjectId,
                                orElse: () => null,
                              );
                          return TaskItemTile(
                            task: task,
                            subject: sub,
                            onToggle: () => _toggleTask(task),
                            onDelete: () => _deleteTask(task),
                            onStartFocus: () => _openTimer(task: task),
                          );
                        },
                      ),

                    const SizedBox(height: 32),

                    // Recent Focus Activity
                    const Text(
                      'Recent Focus Sessions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (_recentSessions.isEmpty)
                      Text(
                        'No sessions recorded yet. Launch the focus timer above!',
                        style: TextStyle(color: Colors.grey.shade600),
                      )
                    else
                      Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF1E2330)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isDark
                                ? Colors.white12
                                : Colors.grey.shade200,
                          ),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _recentSessions.length,
                          separatorBuilder: (ctx, i) => Divider(
                            height: 1,
                            color: isDark
                                ? Colors.white12
                                : Colors.grey.shade100,
                          ),
                          itemBuilder: (context, index) {
                            final sess = _recentSessions[index];
                            final sub = _subjects
                                .cast<StudySubject?>()
                                .firstWhere(
                                  (s) => s?.id == sess.subjectId,
                                  orElse: () => null,
                                );
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.teal.withOpacity(0.15),
                                child: const Icon(
                                  Icons.timer_rounded,
                                  color: Colors.teal,
                                  size: 20,
                                ),
                              ),
                              title: Text(
                                '${sess.durationMinutes} Minutes Focused ${sub != null ? "on ${sub.name}" : ""}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              subtitle: sess.reflectionNotes != null
                                  ? Text(
                                      sess.reflectionNotes!,
                                      style: const TextStyle(fontSize: 12),
                                    )
                                  : null,
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ...List.generate(
                                    sess.productivityScore,
                                    (i) => const Icon(
                                      Icons.star_rounded,
                                      size: 14,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
    );
  }
}
