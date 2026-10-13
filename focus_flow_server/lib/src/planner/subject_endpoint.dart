import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Endpoint managing study subjects.
class SubjectEndpoint extends Endpoint {
  /// Fetches all registered study subjects, sorted by creation date.
  Future<List<StudySubject>> getSubjects(Session session) async {
    return await StudySubject.db.find(
      session,
      orderBy: (t) => t.createdAt,
    );
  }

  /// Creates a new study subject with customizable theme colors.
  Future<StudySubject> createSubject(
    Session session, {
    required String name,
    required String colorHex,
    required String iconName,
  }) async {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw ArgumentError('Subject name cannot be empty.');
    }

    final subject = StudySubject(
      name: trimmedName,
      colorHex: colorHex.isEmpty ? '#3B82F6' : colorHex,
      iconName: iconName.isEmpty ? 'book' : iconName,
      createdAt: DateTime.now(),
    );

    return await StudySubject.db.insertRow(session, subject);
  }

  /// Deletes a study subject along with its associated tasks and focus sessions.
  Future<bool> deleteSubject(Session session, int subjectId) async {
    // Delete attached focus sessions
    await FocusSession.db.deleteWhere(
      session,
      where: (t) => t.subjectId.equals(subjectId),
    );

    // Delete attached tasks
    await StudyTask.db.deleteWhere(
      session,
      where: (t) => t.subjectId.equals(subjectId),
    );

    final deleted = await StudySubject.db.deleteWhere(
      session,
      where: (t) => t.id.equals(subjectId),
    );
    return deleted.isNotEmpty;
  }
}
