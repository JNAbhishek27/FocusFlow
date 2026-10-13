/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import '../planner/task_priority.dart' as _ix7n0lht;

abstract class StudyTask
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  StudyTask._({
    this.id,
    required this.subjectId,
    required this.title,
    this.notes,
    required this.priority,
    required this.estimatedMinutes,
    required this.isCompleted,
    this.dueDate,
    required this.createdAt,
    this.completedAt,
  });

  factory StudyTask({
    int? id,
    required int subjectId,
    required String title,
    String? notes,
    required _ix7n0lht.TaskPriority priority,
    required int estimatedMinutes,
    required bool isCompleted,
    DateTime? dueDate,
    required DateTime createdAt,
    DateTime? completedAt,
  }) = _StudyTaskImpl;

  factory StudyTask.fromJson(Map<String, dynamic> jsonSerialization) {
    return StudyTask(
      id: jsonSerialization['id'] as int?,
      subjectId: jsonSerialization['subjectId'] as int,
      title: jsonSerialization['title'] as String,
      notes: jsonSerialization['notes'] as String?,
      priority: _ix7n0lht.TaskPriority.fromJson(
        (jsonSerialization['priority'] as String),
      ),
      estimatedMinutes: jsonSerialization['estimatedMinutes'] as int,
      isCompleted: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isCompleted'],
      ),
      dueDate: jsonSerialization['dueDate'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['dueDate']),
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int subjectId;

  String title;

  String? notes;

  _ix7n0lht.TaskPriority priority;

  int estimatedMinutes;

  bool isCompleted;

  DateTime? dueDate;

  DateTime createdAt;

  DateTime? completedAt;

  /// Returns a shallow copy of this [StudyTask]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  StudyTask copyWith({
    int? id,
    int? subjectId,
    String? title,
    String? notes,
    _ix7n0lht.TaskPriority? priority,
    int? estimatedMinutes,
    bool? isCompleted,
    DateTime? dueDate,
    DateTime? createdAt,
    DateTime? completedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StudyTask',
      if (id != null) 'id': id,
      'subjectId': subjectId,
      'title': title,
      if (notes != null) 'notes': notes,
      'priority': priority.toJson(),
      'estimatedMinutes': estimatedMinutes,
      'isCompleted': isCompleted,
      if (dueDate != null) 'dueDate': dueDate?.toJson(),
      'createdAt': createdAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StudyTask',
      if (id != null) 'id': id,
      'subjectId': subjectId,
      'title': title,
      if (notes != null) 'notes': notes,
      'priority': priority.toJson(),
      'estimatedMinutes': estimatedMinutes,
      'isCompleted': isCompleted,
      if (dueDate != null) 'dueDate': dueDate?.toJson(),
      'createdAt': createdAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StudyTaskImpl extends StudyTask {
  _StudyTaskImpl({
    int? id,
    required int subjectId,
    required String title,
    String? notes,
    required _ix7n0lht.TaskPriority priority,
    required int estimatedMinutes,
    required bool isCompleted,
    DateTime? dueDate,
    required DateTime createdAt,
    DateTime? completedAt,
  }) : super._(
         id: id,
         subjectId: subjectId,
         title: title,
         notes: notes,
         priority: priority,
         estimatedMinutes: estimatedMinutes,
         isCompleted: isCompleted,
         dueDate: dueDate,
         createdAt: createdAt,
         completedAt: completedAt,
       );

  /// Returns a shallow copy of this [StudyTask]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  StudyTask copyWith({
    Object? id = _Undefined,
    int? subjectId,
    String? title,
    Object? notes = _Undefined,
    _ix7n0lht.TaskPriority? priority,
    int? estimatedMinutes,
    bool? isCompleted,
    Object? dueDate = _Undefined,
    DateTime? createdAt,
    Object? completedAt = _Undefined,
  }) {
    return StudyTask(
      id: id is int? ? id : this.id,
      subjectId: subjectId ?? this.subjectId,
      title: title ?? this.title,
      notes: notes is String? ? notes : this.notes,
      priority: priority ?? this.priority,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate is DateTime? ? dueDate : this.dueDate,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
    );
  }
}
