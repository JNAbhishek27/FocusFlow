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

abstract class StudySubject
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  StudySubject._({
    this.id,
    required this.name,
    required this.colorHex,
    required this.iconName,
    required this.createdAt,
  });

  factory StudySubject({
    int? id,
    required String name,
    required String colorHex,
    required String iconName,
    required DateTime createdAt,
  }) = _StudySubjectImpl;

  factory StudySubject.fromJson(Map<String, dynamic> jsonSerialization) {
    return StudySubject(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      colorHex: jsonSerialization['colorHex'] as String,
      iconName: jsonSerialization['iconName'] as String,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String colorHex;

  String iconName;

  DateTime createdAt;

  /// Returns a shallow copy of this [StudySubject]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  StudySubject copyWith({
    int? id,
    String? name,
    String? colorHex,
    String? iconName,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StudySubject',
      if (id != null) 'id': id,
      'name': name,
      'colorHex': colorHex,
      'iconName': iconName,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StudySubject',
      if (id != null) 'id': id,
      'name': name,
      'colorHex': colorHex,
      'iconName': iconName,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StudySubjectImpl extends StudySubject {
  _StudySubjectImpl({
    int? id,
    required String name,
    required String colorHex,
    required String iconName,
    required DateTime createdAt,
  }) : super._(
         id: id,
         name: name,
         colorHex: colorHex,
         iconName: iconName,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [StudySubject]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  StudySubject copyWith({
    Object? id = _Undefined,
    String? name,
    String? colorHex,
    String? iconName,
    DateTime? createdAt,
  }) {
    return StudySubject(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
      iconName: iconName ?? this.iconName,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
