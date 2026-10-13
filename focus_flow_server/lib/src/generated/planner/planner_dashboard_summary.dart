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

abstract class PlannerDashboardSummary
    implements _is.SerializableModel, _is.ProtocolSerialization {
  PlannerDashboardSummary._({
    required this.totalSubjects,
    required this.pendingTasks,
    required this.completedTasks,
    required this.totalFocusMinutes,
    required this.todayFocusMinutes,
    required this.averageProductivityScore,
  });

  factory PlannerDashboardSummary({
    required int totalSubjects,
    required int pendingTasks,
    required int completedTasks,
    required int totalFocusMinutes,
    required int todayFocusMinutes,
    required double averageProductivityScore,
  }) = _PlannerDashboardSummaryImpl;

  factory PlannerDashboardSummary.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return PlannerDashboardSummary(
      totalSubjects: jsonSerialization['totalSubjects'] as int,
      pendingTasks: jsonSerialization['pendingTasks'] as int,
      completedTasks: jsonSerialization['completedTasks'] as int,
      totalFocusMinutes: jsonSerialization['totalFocusMinutes'] as int,
      todayFocusMinutes: jsonSerialization['todayFocusMinutes'] as int,
      averageProductivityScore:
          (jsonSerialization['averageProductivityScore'] as num).toDouble(),
    );
  }

  int totalSubjects;

  int pendingTasks;

  int completedTasks;

  int totalFocusMinutes;

  int todayFocusMinutes;

  double averageProductivityScore;

  /// Returns a shallow copy of this [PlannerDashboardSummary]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  PlannerDashboardSummary copyWith({
    int? totalSubjects,
    int? pendingTasks,
    int? completedTasks,
    int? totalFocusMinutes,
    int? todayFocusMinutes,
    double? averageProductivityScore,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlannerDashboardSummary',
      'totalSubjects': totalSubjects,
      'pendingTasks': pendingTasks,
      'completedTasks': completedTasks,
      'totalFocusMinutes': totalFocusMinutes,
      'todayFocusMinutes': todayFocusMinutes,
      'averageProductivityScore': averageProductivityScore,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlannerDashboardSummary',
      'totalSubjects': totalSubjects,
      'pendingTasks': pendingTasks,
      'completedTasks': completedTasks,
      'totalFocusMinutes': totalFocusMinutes,
      'todayFocusMinutes': todayFocusMinutes,
      'averageProductivityScore': averageProductivityScore,
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _PlannerDashboardSummaryImpl extends PlannerDashboardSummary {
  _PlannerDashboardSummaryImpl({
    required int totalSubjects,
    required int pendingTasks,
    required int completedTasks,
    required int totalFocusMinutes,
    required int todayFocusMinutes,
    required double averageProductivityScore,
  }) : super._(
         totalSubjects: totalSubjects,
         pendingTasks: pendingTasks,
         completedTasks: completedTasks,
         totalFocusMinutes: totalFocusMinutes,
         todayFocusMinutes: todayFocusMinutes,
         averageProductivityScore: averageProductivityScore,
       );

  /// Returns a shallow copy of this [PlannerDashboardSummary]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  PlannerDashboardSummary copyWith({
    int? totalSubjects,
    int? pendingTasks,
    int? completedTasks,
    int? totalFocusMinutes,
    int? todayFocusMinutes,
    double? averageProductivityScore,
  }) {
    return PlannerDashboardSummary(
      totalSubjects: totalSubjects ?? this.totalSubjects,
      pendingTasks: pendingTasks ?? this.pendingTasks,
      completedTasks: completedTasks ?? this.completedTasks,
      totalFocusMinutes: totalFocusMinutes ?? this.totalFocusMinutes,
      todayFocusMinutes: todayFocusMinutes ?? this.todayFocusMinutes,
      averageProductivityScore:
          averageProductivityScore ?? this.averageProductivityScore,
    );
  }
}
