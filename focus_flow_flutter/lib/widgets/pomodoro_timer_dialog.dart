import 'dart:async';
import 'package:flutter/material.dart';
import 'package:focus_flow_client/focus_flow_client.dart';
import '../client.dart';

class PomodoroTimerDialog extends StatefulWidget {
  final StudyTask? initialTask;
  final StudySubject? initialSubject;
  final VoidCallback onSessionSaved;

  const PomodoroTimerDialog({
    super.key,
    this.initialTask,
    this.initialSubject,
    required this.onSessionSaved,
  });

  @override
  State<PomodoroTimerDialog> createState() => _PomodoroTimerDialogState();
}

class _PomodoroTimerDialogState extends State<PomodoroTimerDialog> {
  int _selectedMinutes = 25;
  int _secondsRemaining = 25 * 60;
  bool _isRunning = false;
  Timer? _ticker;

  int _productivityScore = 5;
  final TextEditingController _notesController = TextEditingController();
  bool _markTaskComplete = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialTask != null) {
      _selectedMinutes = widget.initialTask!.estimatedMinutes.clamp(5, 120);
      _secondsRemaining = _selectedMinutes * 60;
    }
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _notesController.dispose();
    super.dispose();
  }

  void _toggleTimer() {
    if (_isRunning) {
      _ticker?.cancel();
      setState(() {
        _isRunning = false;
      });
    } else {
      setState(() {
        _isRunning = true;
      });
      _ticker = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_secondsRemaining > 0) {
          setState(() {
            _secondsRemaining--;
          });
        } else {
          _ticker?.cancel();
          setState(() {
            _isRunning = false;
          });
        }
      });
    }
  }

  void _resetTimer(int minutes) {
    _ticker?.cancel();
    setState(() {
      _selectedMinutes = minutes;
      _secondsRemaining = minutes * 60;
      _isRunning = false;
    });
  }

  Future<void> _recordSession() async {
    setState(() {
      _isSaving = true;
    });

    final elapsedSeconds = (_selectedMinutes * 60) - _secondsRemaining;
    final loggedMinutes = (elapsedSeconds / 60).ceil().clamp(1, 180);

    try {
      await client.focusSession.recordSession(
        subjectId: widget.initialSubject?.id ?? widget.initialTask?.subjectId,
        taskId: widget.initialTask?.id,
        durationMinutes: loggedMinutes,
        productivityScore: _productivityScore,
        reflectionNotes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        markTaskComplete: _markTaskComplete,
      );

      widget.onSessionSaved();
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.teal.shade700,
            content: Text('🎉 Recorded $loggedMinutes min focus session!'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save session: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  String _formatTime() {
    final m = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final s = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final progress = 1.0 - (_secondsRemaining / (_selectedMinutes * 60));

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 460),
        padding: const EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.initialTask != null
                        ? 'Focusing: ${widget.initialTask!.title}'
                        : 'Deep Focus Session',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 190,
                    height: 190,
                    child: CircularProgressIndicator(
                      value: progress.clamp(0.0, 1.0),
                      strokeWidth: 10,
                      backgroundColor: isDark
                          ? Colors.white12
                          : Colors.grey.shade200,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _formatTime(),
                        style: const TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _isRunning ? 'FOCUS MODE' : 'PAUSED',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: _isRunning ? Colors.teal : Colors.grey,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      backgroundColor: _isRunning
                          ? Colors.amber.shade700
                          : Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _toggleTimer,
                    icon: Icon(
                      _isRunning
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                    ),
                    label: Text(_isRunning ? 'Pause' : 'Start'),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () => _resetTimer(_selectedMinutes),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Reset'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                children: [15, 25, 45, 60].map((m) {
                  final isSelected = _selectedMinutes == m;
                  return ChoiceChip(
                    label: Text('${m}m'),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) _resetTimer(m);
                    },
                  );
                }).toList(),
              ),
              const Divider(height: 36),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Productivity Rating (1-5 stars)',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                  ),
                ),
              ),
              Row(
                children: List.generate(5, (index) {
                  final score = index + 1;
                  return IconButton(
                    icon: Icon(
                      score <= _productivityScore
                          ? Icons.star_rounded
                          : Icons.star_border_rounded,
                      color: Colors.amber,
                      size: 28,
                    ),
                    onPressed: () {
                      setState(() {
                        _productivityScore = score;
                      });
                    },
                  );
                }),
              ),
              TextField(
                controller: _notesController,
                decoration: const InputDecoration(
                  hintText: 'What did you accomplish during this session?',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
                maxLines: 2,
              ),
              if (widget.initialTask != null &&
                  !widget.initialTask!.isCompleted) ...[
                const SizedBox(height: 8),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: _markTaskComplete,
                  title: const Text(
                    'Mark linked task as completed upon saving',
                    style: TextStyle(fontSize: 13),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _markTaskComplete = val ?? false;
                    });
                  },
                ),
              ],
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _isSaving ? null : _recordSession,
                  icon: _isSaving
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.check_circle_rounded),
                  label: const Text('Save & Record to Serverpod'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
