import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Endpoint managing recorded Pomodoro / deep work focus sessions.
class FocusSessionEndpoint extends Endpoint {
  /// Records a completed focus session and optionally marks the linked task completed.
  Future<FocusSession> recordSession(
    Session session, {
    int? subjectId,
    int? taskId,
    required int durationMinutes,
    String? reflectionNotes,
    required int productivityScore,
    bool markTaskComplete = false,
  }) async {
    final clampedScore = productivityScore.clamp(1, 5);
    final validDuration = durationMinutes > 0 ? durationMinutes : 1;

    final focusSession = FocusSession(
      subjectId: subjectId,
      taskId: taskId,
      durationMinutes: validDuration,
      completedAt: DateTime.now(),
      reflectionNotes: reflectionNotes,
      productivityScore: clampedScore,
    );

    final savedSession = await FocusSession.db.insertRow(session, focusSession);

    if (taskId != null && markTaskComplete) {
      final task = await StudyTask.db.findById(session, taskId);
      if (task != null && !task.isCompleted) {
        task.isCompleted = true;
        task.completedAt = DateTime.now();
        await StudyTask.db.updateRow(session, task);
      }
    }

    return savedSession;
  }

  /// Retrieves recent focus sessions.
  Future<List<FocusSession>> getRecentSessions(
    Session session, {
    int limit = 20,
  }) async {
    return await FocusSession.db.find(
      session,
      limit: limit,
      orderBy: (t) => t.completedAt.desc(),
    );
  }
}
