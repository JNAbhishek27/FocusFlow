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

abstract class FocusSession
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  FocusSession._({
    this.id,
    this.subjectId,
    this.taskId,
    required this.durationMinutes,
    required this.completedAt,
    this.reflectionNotes,
    required this.productivityScore,
  });

  factory FocusSession({
    int? id,
    int? subjectId,
    int? taskId,
    required int durationMinutes,
    required DateTime completedAt,
    String? reflectionNotes,
    required int productivityScore,
  }) = _FocusSessionImpl;

  factory FocusSession.fromJson(Map<String, dynamic> jsonSerialization) {
    return FocusSession(
      id: jsonSerialization['id'] as int?,
      subjectId: jsonSerialization['subjectId'] as int?,
      taskId: jsonSerialization['taskId'] as int?,
      durationMinutes: jsonSerialization['durationMinutes'] as int,
      completedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['completedAt'],
      ),
      reflectionNotes: jsonSerialization['reflectionNotes'] as String?,
      productivityScore: jsonSerialization['productivityScore'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? subjectId;

  int? taskId;

  int durationMinutes;

  DateTime completedAt;

  String? reflectionNotes;

  int productivityScore;

  /// Returns a shallow copy of this [FocusSession]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  FocusSession copyWith({
    int? id,
    int? subjectId,
    int? taskId,
    int? durationMinutes,
    DateTime? completedAt,
    String? reflectionNotes,
    int? productivityScore,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FocusSession',
      if (id != null) 'id': id,
      if (subjectId != null) 'subjectId': subjectId,
      if (taskId != null) 'taskId': taskId,
      'durationMinutes': durationMinutes,
      'completedAt': completedAt.toJson(),
      if (reflectionNotes != null) 'reflectionNotes': reflectionNotes,
      'productivityScore': productivityScore,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FocusSession',
      if (id != null) 'id': id,
      if (subjectId != null) 'subjectId': subjectId,
      if (taskId != null) 'taskId': taskId,
      'durationMinutes': durationMinutes,
      'completedAt': completedAt.toJson(),
      if (reflectionNotes != null) 'reflectionNotes': reflectionNotes,
      'productivityScore': productivityScore,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FocusSessionImpl extends FocusSession {
  _FocusSessionImpl({
    int? id,
    int? subjectId,
    int? taskId,
    required int durationMinutes,
    required DateTime completedAt,
    String? reflectionNotes,
    required int productivityScore,
  }) : super._(
         id: id,
         subjectId: subjectId,
         taskId: taskId,
         durationMinutes: durationMinutes,
         completedAt: completedAt,
         reflectionNotes: reflectionNotes,
         productivityScore: productivityScore,
       );

  /// Returns a shallow copy of this [FocusSession]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  FocusSession copyWith({
    Object? id = _Undefined,
    Object? subjectId = _Undefined,
    Object? taskId = _Undefined,
    int? durationMinutes,
    DateTime? completedAt,
    Object? reflectionNotes = _Undefined,
    int? productivityScore,
  }) {
    return FocusSession(
      id: id is int? ? id : this.id,
      subjectId: subjectId is int? ? subjectId : this.subjectId,
      taskId: taskId is int? ? taskId : this.taskId,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      completedAt: completedAt ?? this.completedAt,
      reflectionNotes: reflectionNotes is String?
          ? reflectionNotes
          : this.reflectionNotes,
      productivityScore: productivityScore ?? this.productivityScore,
    );
  }
}
