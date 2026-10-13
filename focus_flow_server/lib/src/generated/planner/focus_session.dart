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

abstract class FocusSession
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      completedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['completedAt'],
      ),
      reflectionNotes: jsonSerialization['reflectionNotes'] as String?,
      productivityScore: jsonSerialization['productivityScore'] as int,
    );
  }

  static final t = FocusSessionTable();

  static const db = FocusSessionRepository._();

  @override
  int? id;

  int? subjectId;

  int? taskId;

  int durationMinutes;

  DateTime completedAt;

  String? reflectionNotes;

  int productivityScore;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [FocusSession]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static FocusSessionInclude include() {
    return FocusSessionInclude._();
  }

  static FocusSessionIncludeList includeList({
    _is.WhereExpressionBuilder<FocusSessionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FocusSessionTable>? orderBy,
    _is.OrderByListBuilder<FocusSessionTable>? orderByList,
    FocusSessionInclude? include,
  }) {
    return FocusSessionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FocusSession.t),
      orderByList: orderByList?.call(FocusSession.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class FocusSessionUpdateTable extends _is.UpdateTable<FocusSessionTable> {
  FocusSessionUpdateTable(super.table);

  _is.ColumnValue<int, int> subjectId(int? value) => _is.ColumnValue(
    table.subjectId,
    value,
  );

  _is.ColumnValue<int, int> taskId(int? value) => _is.ColumnValue(
    table.taskId,
    value,
  );

  _is.ColumnValue<int, int> durationMinutes(int value) => _is.ColumnValue(
    table.durationMinutes,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> completedAt(DateTime value) =>
      _is.ColumnValue(
        table.completedAt,
        value,
      );

  _is.ColumnValue<String, String> reflectionNotes(String? value) =>
      _is.ColumnValue(
        table.reflectionNotes,
        value,
      );

  _is.ColumnValue<int, int> productivityScore(int value) => _is.ColumnValue(
    table.productivityScore,
    value,
  );
}

class FocusSessionTable extends _is.Table<int?> {
  FocusSessionTable({super.tableRelation})
    : super(tableName: 'focus_sessions') {
    updateTable = FocusSessionUpdateTable(this);
    subjectId = _is.ColumnInt(
      'subjectId',
      this,
    );
    taskId = _is.ColumnInt(
      'taskId',
      this,
    );
    durationMinutes = _is.ColumnInt(
      'durationMinutes',
      this,
    );
    completedAt = _is.ColumnDateTime(
      'completedAt',
      this,
    );
    reflectionNotes = _is.ColumnString(
      'reflectionNotes',
      this,
    );
    productivityScore = _is.ColumnInt(
      'productivityScore',
      this,
    );
  }

  late final FocusSessionUpdateTable updateTable;

  late final _is.ColumnInt subjectId;

  late final _is.ColumnInt taskId;

  late final _is.ColumnInt durationMinutes;

  late final _is.ColumnDateTime completedAt;

  late final _is.ColumnString reflectionNotes;

  late final _is.ColumnInt productivityScore;

  @override
  List<_is.Column> get columns => [
    id,
    subjectId,
    taskId,
    durationMinutes,
    completedAt,
    reflectionNotes,
    productivityScore,
  ];
}

class FocusSessionInclude extends _is.IncludeObject {
  FocusSessionInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => FocusSession.t;
}

class FocusSessionIncludeList extends _is.IncludeList {
  FocusSessionIncludeList._({
    _is.WhereExpressionBuilder<FocusSessionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FocusSession.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => FocusSession.t;
}

class FocusSessionRepository {
  const FocusSessionRepository._();

  /// Returns a list of [FocusSession]s matching the given query parameters.
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
  Future<List<FocusSession>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FocusSessionTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FocusSessionTable>? orderBy,
    _is.OrderByListBuilder<FocusSessionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<FocusSession>(
      where: where?.call(FocusSession.t),
      orderBy: orderBy?.call(FocusSession.t),
      orderByList: orderByList?.call(FocusSession.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [FocusSession] matching the given query parameters.
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
  Future<FocusSession?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FocusSessionTable>? where,
    int? offset,
    _is.OrderByBuilder<FocusSessionTable>? orderBy,
    _is.OrderByListBuilder<FocusSessionTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<FocusSession>(
      where: where?.call(FocusSession.t),
      orderBy: orderBy?.call(FocusSession.t),
      orderByList: orderByList?.call(FocusSession.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [FocusSession] by its [id] or null if no such row exists.
  Future<FocusSession?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<FocusSession>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [FocusSession]s in the list and returns the inserted rows.
  ///
  /// The returned [FocusSession]s will have their `id` fields set.
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
  Future<List<FocusSession>> insert(
    _is.DatabaseSession session,
    List<FocusSession> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<FocusSession>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [FocusSession] and returns the inserted row.
  ///
  /// The returned [FocusSession] will have its `id` field set.
  Future<FocusSession> insertRow(
    _is.DatabaseSession session,
    FocusSession row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<FocusSession>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [FocusSession]s in the list and returns the resulting rows.
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
  /// The returned [FocusSession]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FocusSession>> upsert(
    _is.DatabaseSession session,
    List<FocusSession> rows, {
    required _is.ColumnSelections<FocusSessionTable> conflictColumns,
    _is.ColumnSelections<FocusSessionTable>? updateColumns,
    _is.WhereExpressionBuilder<FocusSessionTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<FocusSession>(
      rows,
      conflictColumns: conflictColumns(FocusSession.t),
      updateColumns: updateColumns?.call(FocusSession.t),
      updateWhere: updateWhere?.call(FocusSession.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [FocusSession] and returns the resulting row.
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
  /// The returned [FocusSession] will have its `id` field set.
  Future<FocusSession?> upsertRow(
    _is.DatabaseSession session,
    FocusSession row, {
    required _is.ColumnSelections<FocusSessionTable> conflictColumns,
    _is.ColumnSelections<FocusSessionTable>? updateColumns,
    _is.WhereExpressionBuilder<FocusSessionTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<FocusSession>(
      row,
      conflictColumns: conflictColumns(FocusSession.t),
      updateColumns: updateColumns?.call(FocusSession.t),
      updateWhere: updateWhere?.call(FocusSession.t),
      transaction: transaction,
    );
  }

  /// Updates all [FocusSession]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FocusSession>> update(
    _is.DatabaseSession session,
    List<FocusSession> rows, {
    _is.ColumnSelections<FocusSessionTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<FocusSession>(
      rows,
      columns: columns?.call(FocusSession.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [FocusSession]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<FocusSession> updateRow(
    _is.DatabaseSession session,
    FocusSession row, {
    _is.ColumnSelections<FocusSessionTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<FocusSession>(
      row,
      columns: columns?.call(FocusSession.t),
      transaction: transaction,
    );
  }

  /// Updates a single [FocusSession] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<FocusSession?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<FocusSessionUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<FocusSession>(
      id,
      columnValues: columnValues(FocusSession.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [FocusSession]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FocusSession>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<FocusSessionUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<FocusSessionTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FocusSessionTable>? orderBy,
    _is.OrderByListBuilder<FocusSessionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<FocusSession>(
      columnValues: columnValues(FocusSession.t.updateTable),
      where: where(FocusSession.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FocusSession.t),
      orderByList: orderByList?.call(FocusSession.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [FocusSession]s in the list and returns the deleted rows.
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
  Future<List<FocusSession>> delete(
    _is.DatabaseSession session,
    List<FocusSession> rows, {
    _is.OrderByBuilder<FocusSessionTable>? orderBy,
    _is.OrderByListBuilder<FocusSessionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<FocusSession>(
      rows,
      orderBy: orderBy?.call(FocusSession.t),
      orderByList: orderByList?.call(FocusSession.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [FocusSession].
  Future<FocusSession> deleteRow(
    _is.DatabaseSession session,
    FocusSession row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FocusSession>(
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
  Future<List<FocusSession>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FocusSessionTable> where,
    _is.OrderByBuilder<FocusSessionTable>? orderBy,
    _is.OrderByListBuilder<FocusSessionTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<FocusSession>(
      where: where(FocusSession.t),
      orderBy: orderBy?.call(FocusSession.t),
      orderByList: orderByList?.call(FocusSession.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FocusSessionTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<FocusSession>(
      where: where?.call(FocusSession.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [FocusSession] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FocusSessionTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<FocusSession>(
      where: where(FocusSession.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
