import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Endpoint managing study tasks and completion status.
class TaskEndpoint extends Endpoint {
  /// Fetches tasks. If [subjectId] is specified, filters by that subject.
  Future<List<StudyTask>> getTasks(
    Session session, {
    int? subjectId,
    bool? isCompleted,
  }) async {
    return await StudyTask.db.find(
      session,
      where: (t) {
        Expression? expression;
        if (subjectId != null) {
          expression = t.subjectId.equals(subjectId);
        }
        if (isCompleted != null) {
          final completedFilter = t.isCompleted.equals(isCompleted);
          expression = expression == null
              ? completedFilter
              : (expression & completedFilter);
        }
        return expression ?? Constant.bool(true);
      },
      orderBy: (t) => t.dueDate,
    );
  }

  /// Creates a new study task.
  Future<StudyTask> createTask(
    Session session, {
    required int subjectId,
    required String title,
    String? notes,
    required TaskPriority priority,
    required int estimatedMinutes,
    DateTime? dueDate,
  }) async {
    final trimmedTitle = title.trim();
    if (trimmedTitle.isEmpty) {
      throw ArgumentError('Task title cannot be empty.');
    }

    final task = StudyTask(
      subjectId: subjectId,
      title: trimmedTitle,
      notes: notes,
      priority: priority,
      estimatedMinutes: estimatedMinutes > 0 ? estimatedMinutes : 25,
      isCompleted: false,
      dueDate: dueDate,
      createdAt: DateTime.now(),
      completedAt: null,
    );

    return await StudyTask.db.insertRow(session, task);
  }

  /// Toggles task completion state.
  Future<StudyTask?> toggleTaskCompletion(
    Session session,
    int taskId,
  ) async {
    final task = await StudyTask.db.findById(session, taskId);
    if (task == null) return null;

    final willBeCompleted = !task.isCompleted;
    task.isCompleted = willBeCompleted;
    task.completedAt = willBeCompleted ? DateTime.now() : null;

    return await StudyTask.db.updateRow(session, task);
  }

  /// Deletes a task by id.
  Future<bool> deleteTask(Session session, int taskId) async {
    // Clean up focus sessions that were tied to this specific task
    await FocusSession.db.deleteWhere(
      session,
      where: (t) => t.taskId.equals(taskId),
    );

    final deleted = await StudyTask.db.deleteWhere(
      session,
      where: (t) => t.id.equals(taskId),
    );
    return deleted.isNotEmpty;
  }
}
