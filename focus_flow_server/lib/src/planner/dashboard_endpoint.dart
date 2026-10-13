import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Endpoint computing aggregated analytics and study statistics.
class DashboardEndpoint extends Endpoint {
  /// Aggregates real-time metrics across subjects, tasks, and focus time.
  Future<PlannerDashboardSummary> getSummary(Session session) async {
    final subjects = await StudySubject.db.find(session);
    final tasks = await StudyTask.db.find(session);
    final sessions = await FocusSession.db.find(session);

    final totalSubjects = subjects.length;
    var pendingTasks = 0;
    var completedTasks = 0;

    for (final task in tasks) {
      if (task.isCompleted) {
        completedTasks++;
      } else {
        pendingTasks++;
      }
    }

    var totalFocusMinutes = 0;
    var todayFocusMinutes = 0;
    var totalScoreSum = 0;

    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);

    for (final s in sessions) {
      totalFocusMinutes += s.durationMinutes;
      if (s.completedAt.isAfter(todayStart)) {
        todayFocusMinutes += s.durationMinutes;
      }
      totalScoreSum += s.productivityScore;
    }

    final averageProductivityScore = sessions.isEmpty
        ? 0.0
        : double.parse((totalScoreSum / sessions.length).toStringAsFixed(1));

    return PlannerDashboardSummary(
      totalSubjects: totalSubjects,
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      totalFocusMinutes: totalFocusMinutes,
      todayFocusMinutes: todayFocusMinutes,
      averageProductivityScore: averageProductivityScore,
    );
  }
}
