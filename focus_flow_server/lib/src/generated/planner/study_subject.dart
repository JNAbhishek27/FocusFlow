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
import 'package:serverpod/serverpod.dart' as _is;

abstract class StudySubject
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = StudySubjectTable();

  static const db = StudySubjectRepository._();

  @override
  int? id;

  String name;

  String colorHex;

  String iconName;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [StudySubject]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static StudySubjectInclude include() {
    return StudySubjectInclude._();
  }

  static StudySubjectIncludeList includeList({
    _is.WhereExpressionBuilder<StudySubjectTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StudySubjectTable>? orderBy,
    _is.OrderByListBuilder<StudySubjectTable>? orderByList,
    StudySubjectInclude? include,
  }) {
    return StudySubjectIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StudySubject.t),
      orderByList: orderByList?.call(StudySubject.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class StudySubjectUpdateTable extends _is.UpdateTable<StudySubjectTable> {
  StudySubjectUpdateTable(super.table);

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<String, String> colorHex(String value) => _is.ColumnValue(
    table.colorHex,
    value,
  );

  _is.ColumnValue<String, String> iconName(String value) => _is.ColumnValue(
    table.iconName,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class StudySubjectTable extends _is.Table<int?> {
  StudySubjectTable({super.tableRelation})
    : super(tableName: 'study_subjects') {
    updateTable = StudySubjectUpdateTable(this);
    name = _is.ColumnString(
      'name',
      this,
    );
    colorHex = _is.ColumnString(
      'colorHex',
      this,
    );
    iconName = _is.ColumnString(
      'iconName',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final StudySubjectUpdateTable updateTable;

  late final _is.ColumnString name;

  late final _is.ColumnString colorHex;

  late final _is.ColumnString iconName;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    name,
    colorHex,
    iconName,
    createdAt,
  ];
}

class StudySubjectInclude extends _is.IncludeObject {
  StudySubjectInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => StudySubject.t;
}

class StudySubjectIncludeList extends _is.IncludeList {
  StudySubjectIncludeList._({
    _is.WhereExpressionBuilder<StudySubjectTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StudySubject.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => StudySubject.t;
}

class StudySubjectRepository {
  const StudySubjectRepository._();

  /// Returns a list of [StudySubject]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<StudySubject>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StudySubjectTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StudySubjectTable>? orderBy,
    _is.OrderByListBuilder<StudySubjectTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<StudySubject>(
      where: where?.call(StudySubject.t),
      orderBy: orderBy?.call(StudySubject.t),
      orderByList: orderByList?.call(StudySubject.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [StudySubject] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<StudySubject?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StudySubjectTable>? where,
    int? offset,
    _is.OrderByBuilder<StudySubjectTable>? orderBy,
    _is.OrderByListBuilder<StudySubjectTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<StudySubject>(
      where: where?.call(StudySubject.t),
      orderBy: orderBy?.call(StudySubject.t),
      orderByList: orderByList?.call(StudySubject.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [StudySubject] by its [id] or null if no such row exists.
  Future<StudySubject?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<StudySubject>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [StudySubject]s in the list and returns the inserted rows.
  ///
  /// The returned [StudySubject]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StudySubject>> insert(
    _is.DatabaseSession session,
    List<StudySubject> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<StudySubject>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [StudySubject] and returns the inserted row.
  ///
  /// The returned [StudySubject] will have its `id` field set.
  Future<StudySubject> insertRow(
    _is.DatabaseSession session,
    StudySubject row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<StudySubject>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [StudySubject]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [StudySubject]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StudySubject>> upsert(
    _is.DatabaseSession session,
    List<StudySubject> rows, {
    required _is.ColumnSelections<StudySubjectTable> conflictColumns,
    _is.ColumnSelections<StudySubjectTable>? updateColumns,
    _is.WhereExpressionBuilder<StudySubjectTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<StudySubject>(
      rows,
      conflictColumns: conflictColumns(StudySubject.t),
      updateColumns: updateColumns?.call(StudySubject.t),
      updateWhere: updateWhere?.call(StudySubject.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [StudySubject] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [StudySubject] will have its `id` field set.
  Future<StudySubject?> upsertRow(
    _is.DatabaseSession session,
    StudySubject row, {
    required _is.ColumnSelections<StudySubjectTable> conflictColumns,
    _is.ColumnSelections<StudySubjectTable>? updateColumns,
    _is.WhereExpressionBuilder<StudySubjectTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<StudySubject>(
      row,
      conflictColumns: conflictColumns(StudySubject.t),
      updateColumns: updateColumns?.call(StudySubject.t),
      updateWhere: updateWhere?.call(StudySubject.t),
      transaction: transaction,
    );
  }

  /// Updates all [StudySubject]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StudySubject>> update(
    _is.DatabaseSession session,
    List<StudySubject> rows, {
    _is.ColumnSelections<StudySubjectTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<StudySubject>(
      rows,
      columns: columns?.call(StudySubject.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [StudySubject]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StudySubject> updateRow(
    _is.DatabaseSession session,
    StudySubject row, {
    _is.ColumnSelections<StudySubjectTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<StudySubject>(
      row,
      columns: columns?.call(StudySubject.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StudySubject] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StudySubject?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<StudySubjectUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<StudySubject>(
      id,
      columnValues: columnValues(StudySubject.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StudySubject]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StudySubject>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<StudySubjectUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<StudySubjectTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StudySubjectTable>? orderBy,
    _is.OrderByListBuilder<StudySubjectTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<StudySubject>(
      columnValues: columnValues(StudySubject.t.updateTable),
      where: where(StudySubject.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StudySubject.t),
      orderByList: orderByList?.call(StudySubject.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [StudySubject]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StudySubject>> delete(
    _is.DatabaseSession session,
    List<StudySubject> rows, {
    _is.OrderByBuilder<StudySubjectTable>? orderBy,
    _is.OrderByListBuilder<StudySubjectTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<StudySubject>(
      rows,
      orderBy: orderBy?.call(StudySubject.t),
      orderByList: orderByList?.call(StudySubject.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [StudySubject].
  Future<StudySubject> deleteRow(
    _is.DatabaseSession session,
    StudySubject row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StudySubject>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StudySubject>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<StudySubjectTable> where,
    _is.OrderByBuilder<StudySubjectTable>? orderBy,
    _is.OrderByListBuilder<StudySubjectTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<StudySubject>(
      where: where(StudySubject.t),
      orderBy: orderBy?.call(StudySubject.t),
      orderByList: orderByList?.call(StudySubject.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StudySubjectTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<StudySubject>(
      where: where?.call(StudySubject.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [StudySubject] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<StudySubjectTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<StudySubject>(
      where: where(StudySubject.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
