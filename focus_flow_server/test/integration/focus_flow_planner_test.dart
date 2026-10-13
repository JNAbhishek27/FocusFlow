import 'package:focus_flow_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given FocusFlow Planner Endpoints', (
    sessionBuilder,
    endpoints,
  ) {
    test(
      'Can create subjects, tasks, record focus sessions, and aggregate dashboard metrics',
      () async {
        // 1. Create a subject
        final mathSubject = await endpoints.subject.createSubject(
          sessionBuilder,
          name: 'Mathematics',
          colorHex: '#3B82F6',
          iconName: 'calculator',
        );
        expect(mathSubject.id, isNotNull);
        expect(mathSubject.name, equals('Mathematics'));

        // 2. Query subjects
        final subjects = await endpoints.subject.getSubjects(sessionBuilder);
        expect(subjects.any((s) => s.id == mathSubject.id), isTrue);

        // 3. Create a task for the subject
        final algebraTask = await endpoints.task.createTask(
          sessionBuilder,
          subjectId: mathSubject.id!,
          title: 'Solve Linear Algebra Problem Set 3',
          notes: 'Chapter 4 vectors and matrix multiplication',
          priority: TaskPriority.high,
          estimatedMinutes: 45,
          dueDate: DateTime.now().add(const Duration(days: 2)),
        );
        expect(algebraTask.id, isNotNull);
        expect(algebraTask.isCompleted, isFalse);
        expect(algebraTask.priority, equals(TaskPriority.high));

        // 4. Retrieve pending tasks
        final pendingTasks = await endpoints.task.getTasks(
          sessionBuilder,
          subjectId: mathSubject.id,
          isCompleted: false,
        );
        expect(pendingTasks.any((t) => t.id == algebraTask.id), isTrue);

        // 5. Record a completed deep-work session
        final session = await endpoints.focusSession.recordSession(
          sessionBuilder,
          subjectId: mathSubject.id,
          taskId: algebraTask.id,
          durationMinutes: 45,
          productivityScore: 5,
          reflectionNotes: 'Finished all matrix transformation proofs!',
          markTaskComplete: true,
        );
        expect(session.id, isNotNull);
        expect(session.durationMinutes, equals(45));
        expect(session.productivityScore, equals(5));

        // 6. Verify task marked completed
        final completedTasks = await endpoints.task.getTasks(
          sessionBuilder,
          subjectId: mathSubject.id,
          isCompleted: true,
        );
        expect(completedTasks.any((t) => t.id == algebraTask.id), isTrue);

        // 7. Test Dashboard summary aggregation
        final summary = await endpoints.dashboard.getSummary(sessionBuilder);
        expect(summary.totalSubjects, greaterThanOrEqualTo(1));
        expect(summary.completedTasks, greaterThanOrEqualTo(1));
        expect(summary.totalFocusMinutes, greaterThanOrEqualTo(45));
        expect(summary.averageProductivityScore, greaterThan(0));

        // 8. Delete task and subject
        final taskDeleted = await endpoints.task.deleteTask(
          sessionBuilder,
          algebraTask.id!,
        );
        expect(taskDeleted, isTrue);

        final subjectDeleted = await endpoints.subject.deleteSubject(
          sessionBuilder,
          mathSubject.id!,
        );
        expect(subjectDeleted, isTrue);
      },
    );
  });
}
