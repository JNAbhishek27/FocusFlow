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
import '../planner/task_priority.dart' as _ix7n0lht;

abstract class StudyTask
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      isCompleted: _is.BoolJsonExtension.fromJson(
        jsonSerialization['isCompleted'],
      ),
      dueDate: jsonSerialization['dueDate'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['dueDate']),
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
    );
  }

  static final t = StudyTaskTable();

  static const db = StudyTaskRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [StudyTask]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static StudyTaskInclude include() {
    return StudyTaskInclude._();
  }

  static StudyTaskIncludeList includeList({
    _is.WhereExpressionBuilder<StudyTaskTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StudyTaskTable>? orderBy,
    _is.OrderByListBuilder<StudyTaskTable>? orderByList,
    StudyTaskInclude? include,
  }) {
    return StudyTaskIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StudyTask.t),
      orderByList: orderByList?.call(StudyTask.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class StudyTaskUpdateTable extends _is.UpdateTable<StudyTaskTable> {
  StudyTaskUpdateTable(super.table);

  _is.ColumnValue<int, int> subjectId(int value) => _is.ColumnValue(
    table.subjectId,
    value,
  );

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
    table.title,
    value,
  );

  _is.ColumnValue<String, String> notes(String? value) => _is.ColumnValue(
    table.notes,
    value,
  );

  _is.ColumnValue<_ix7n0lht.TaskPriority, _ix7n0lht.TaskPriority> priority(
    _ix7n0lht.TaskPriority value,
  ) => _is.ColumnValue(
    table.priority,
    value,
  );

  _is.ColumnValue<int, int> estimatedMinutes(int value) => _is.ColumnValue(
    table.estimatedMinutes,
    value,
  );

  _is.ColumnValue<bool, bool> isCompleted(bool value) => _is.ColumnValue(
    table.isCompleted,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> dueDate(DateTime? value) =>
      _is.ColumnValue(
        table.dueDate,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> completedAt(DateTime? value) =>
      _is.ColumnValue(
        table.completedAt,
        value,
      );
}

class StudyTaskTable extends _is.Table<int?> {
  StudyTaskTable({super.tableRelation}) : super(tableName: 'study_tasks') {
    updateTable = StudyTaskUpdateTable(this);
    subjectId = _is.ColumnInt(
      'subjectId',
      this,
    );
    title = _is.ColumnString(
      'title',
      this,
    );
    notes = _is.ColumnString(
      'notes',
      this,
    );
    priority = _is.ColumnEnum(
      'priority',
      this,
      _is.EnumSerialization.byName,
    );
    estimatedMinutes = _is.ColumnInt(
      'estimatedMinutes',
      this,
    );
    isCompleted = _is.ColumnBool(
      'isCompleted',
      this,
    );
    dueDate = _is.ColumnDateTime(
      'dueDate',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
    completedAt = _is.ColumnDateTime(
      'completedAt',
      this,
    );
  }

  late final StudyTaskUpdateTable updateTable;

  late final _is.ColumnInt subjectId;

  late final _is.ColumnString title;

  late final _is.ColumnString notes;

  late final _is.ColumnEnum<_ix7n0lht.TaskPriority> priority;

  late final _is.ColumnInt estimatedMinutes;

  late final _is.ColumnBool isCompleted;

  late final _is.ColumnDateTime dueDate;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime completedAt;

  @override
  List<_is.Column> get columns => [
    id,
    subjectId,
    title,
    notes,
    priority,
    estimatedMinutes,
    isCompleted,
    dueDate,
    createdAt,
    completedAt,
  ];
}

class StudyTaskInclude extends _is.IncludeObject {
  StudyTaskInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => StudyTask.t;
}

class StudyTaskIncludeList extends _is.IncludeList {
  StudyTaskIncludeList._({
    _is.WhereExpressionBuilder<StudyTaskTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StudyTask.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => StudyTask.t;
}

class StudyTaskRepository {
  const StudyTaskRepository._();

  /// Returns a list of [StudyTask]s matching the given query parameters.
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
  Future<List<StudyTask>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StudyTaskTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StudyTaskTable>? orderBy,
    _is.OrderByListBuilder<StudyTaskTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<StudyTask>(
      where: where?.call(StudyTask.t),
      orderBy: orderBy?.call(StudyTask.t),
      orderByList: orderByList?.call(StudyTask.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [StudyTask] matching the given query parameters.
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
  Future<StudyTask?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StudyTaskTable>? where,
    int? offset,
    _is.OrderByBuilder<StudyTaskTable>? orderBy,
    _is.OrderByListBuilder<StudyTaskTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<StudyTask>(
      where: where?.call(StudyTask.t),
      orderBy: orderBy?.call(StudyTask.t),
      orderByList: orderByList?.call(StudyTask.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [StudyTask] by its [id] or null if no such row exists.
  Future<StudyTask?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<StudyTask>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [StudyTask]s in the list and returns the inserted rows.
  ///
  /// The returned [StudyTask]s will have their `id` fields set.
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
  Future<List<StudyTask>> insert(
    _is.DatabaseSession session,
    List<StudyTask> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<StudyTask>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [StudyTask] and returns the inserted row.
  ///
  /// The returned [StudyTask] will have its `id` field set.
  Future<StudyTask> insertRow(
    _is.DatabaseSession session,
    StudyTask row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<StudyTask>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [StudyTask]s in the list and returns the resulting rows.
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
  /// The returned [StudyTask]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StudyTask>> upsert(
    _is.DatabaseSession session,
    List<StudyTask> rows, {
    required _is.ColumnSelections<StudyTaskTable> conflictColumns,
    _is.ColumnSelections<StudyTaskTable>? updateColumns,
    _is.WhereExpressionBuilder<StudyTaskTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<StudyTask>(
      rows,
      conflictColumns: conflictColumns(StudyTask.t),
      updateColumns: updateColumns?.call(StudyTask.t),
      updateWhere: updateWhere?.call(StudyTask.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [StudyTask] and returns the resulting row.
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
  /// The returned [StudyTask] will have its `id` field set.
  Future<StudyTask?> upsertRow(
    _is.DatabaseSession session,
    StudyTask row, {
    required _is.ColumnSelections<StudyTaskTable> conflictColumns,
    _is.ColumnSelections<StudyTaskTable>? updateColumns,
    _is.WhereExpressionBuilder<StudyTaskTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<StudyTask>(
      row,
      conflictColumns: conflictColumns(StudyTask.t),
      updateColumns: updateColumns?.call(StudyTask.t),
      updateWhere: updateWhere?.call(StudyTask.t),
      transaction: transaction,
    );
  }

  /// Updates all [StudyTask]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StudyTask>> update(
    _is.DatabaseSession session,
    List<StudyTask> rows, {
    _is.ColumnSelections<StudyTaskTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<StudyTask>(
      rows,
      columns: columns?.call(StudyTask.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [StudyTask]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StudyTask> updateRow(
    _is.DatabaseSession session,
    StudyTask row, {
    _is.ColumnSelections<StudyTaskTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<StudyTask>(
      row,
      columns: columns?.call(StudyTask.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StudyTask] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StudyTask?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<StudyTaskUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<StudyTask>(
      id,
      columnValues: columnValues(StudyTask.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StudyTask]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<StudyTask>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<StudyTaskUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<StudyTaskTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<StudyTaskTable>? orderBy,
    _is.OrderByListBuilder<StudyTaskTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<StudyTask>(
      columnValues: columnValues(StudyTask.t.updateTable),
      where: where(StudyTask.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StudyTask.t),
      orderByList: orderByList?.call(StudyTask.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [StudyTask]s in the list and returns the deleted rows.
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
  Future<List<StudyTask>> delete(
    _is.DatabaseSession session,
    List<StudyTask> rows, {
    _is.OrderByBuilder<StudyTaskTable>? orderBy,
    _is.OrderByListBuilder<StudyTaskTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<StudyTask>(
      rows,
      orderBy: orderBy?.call(StudyTask.t),
      orderByList: orderByList?.call(StudyTask.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [StudyTask].
  Future<StudyTask> deleteRow(
    _is.DatabaseSession session,
    StudyTask row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StudyTask>(
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
  Future<List<StudyTask>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<StudyTaskTable> where,
    _is.OrderByBuilder<StudyTaskTable>? orderBy,
    _is.OrderByListBuilder<StudyTaskTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<StudyTask>(
      where: where(StudyTask.t),
      orderBy: orderBy?.call(StudyTask.t),
      orderByList: orderByList?.call(StudyTask.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<StudyTaskTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<StudyTask>(
      where: where?.call(StudyTask.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [StudyTask] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<StudyTaskTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<StudyTask>(
      where: where(StudyTask.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
