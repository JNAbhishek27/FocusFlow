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
import 'dart:async' as _ida;
import 'package:focus_flow_client/src/protocol/greetings/greeting.dart'
    as _i6tspste;
import 'package:focus_flow_client/src/protocol/planner/focus_session.dart'
    as _ixbfm0z7;
import 'package:focus_flow_client/src/protocol/planner/planner_dashboard_summary.dart'
    as _icmn61ch;
import 'package:focus_flow_client/src/protocol/planner/study_subject.dart'
    as _i6g9ut5j;
import 'package:focus_flow_client/src/protocol/planner/study_task.dart'
    as _idi7gx7k;
import 'package:focus_flow_client/src/protocol/planner/task_priority.dart'
    as _isgah3pl;
import 'package:http/http.dart' as _i85jenna;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'protocol.dart' as _il2as5qe;

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _iaic.EndpointEmailIdpBase {
  EndpointEmailIdp(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<_iacc.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _ida.Future<_isc.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _ida.Future<String> verifyRegistrationCode({
    required _isc.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _ida.Future<_iacc.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _ida.Future<_isc.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _ida.Future<String> verifyPasswordResetCode({
    required _isc.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _ida.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _iacc.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// If [refreshToken] is omitted, cookie-mode web clients fall back to the
  /// configured HttpOnly refresh cookie. When neither source is present this
  /// throws [RefreshTokenNotFoundException], the same public "no usable refresh
  /// credential" exception used for unknown refresh tokens.
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _ida.Future<_iacc.AuthSuccess> refreshAccessToken({String? refreshToken}) =>
      caller.callServerEndpoint<_iacc.AuthSuccess>(
        'jwtRefresh',
        'refreshAccessToken',
        {'refreshToken': refreshToken},
        authenticated: false,
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _isc.EndpointRef {
  EndpointGreeting(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _ida.Future<_i6tspste.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i6tspste.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

/// Endpoint computing aggregated analytics and study statistics.
/// {@category Endpoint}
class EndpointDashboard extends _isc.EndpointRef {
  EndpointDashboard(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'dashboard';

  /// Aggregates real-time metrics across subjects, tasks, and focus time.
  _ida.Future<_icmn61ch.PlannerDashboardSummary> getSummary() =>
      caller.callServerEndpoint<_icmn61ch.PlannerDashboardSummary>(
        'dashboard',
        'getSummary',
        {},
      );
}

/// Endpoint managing recorded Pomodoro / deep work focus sessions.
/// {@category Endpoint}
class EndpointFocusSession extends _isc.EndpointRef {
  EndpointFocusSession(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'focusSession';

  /// Records a completed focus session and optionally marks the linked task completed.
  _ida.Future<_ixbfm0z7.FocusSession> recordSession({
    int? subjectId,
    int? taskId,
    required int durationMinutes,
    String? reflectionNotes,
    required int productivityScore,
    required bool markTaskComplete,
  }) => caller.callServerEndpoint<_ixbfm0z7.FocusSession>(
    'focusSession',
    'recordSession',
    {
      'subjectId': subjectId,
      'taskId': taskId,
      'durationMinutes': durationMinutes,
      'reflectionNotes': reflectionNotes,
      'productivityScore': productivityScore,
      'markTaskComplete': markTaskComplete,
    },
  );

  /// Retrieves recent focus sessions.
  _ida.Future<List<_ixbfm0z7.FocusSession>> getRecentSessions({
    required int limit,
  }) => caller.callServerEndpoint<List<_ixbfm0z7.FocusSession>>(
    'focusSession',
    'getRecentSessions',
    {'limit': limit},
  );
}

/// Endpoint managing study subjects.
/// {@category Endpoint}
class EndpointSubject extends _isc.EndpointRef {
  EndpointSubject(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'subject';

  /// Fetches all registered study subjects, sorted by creation date.
  _ida.Future<List<_i6g9ut5j.StudySubject>> getSubjects() =>
      caller.callServerEndpoint<List<_i6g9ut5j.StudySubject>>(
        'subject',
        'getSubjects',
        {},
      );

  /// Creates a new study subject with customizable theme colors.
  _ida.Future<_i6g9ut5j.StudySubject> createSubject({
    required String name,
    required String colorHex,
    required String iconName,
  }) => caller.callServerEndpoint<_i6g9ut5j.StudySubject>(
    'subject',
    'createSubject',
    {
      'name': name,
      'colorHex': colorHex,
      'iconName': iconName,
    },
  );

  /// Deletes a study subject along with its associated tasks and focus sessions.
  _ida.Future<bool> deleteSubject(int subjectId) =>
      caller.callServerEndpoint<bool>(
        'subject',
        'deleteSubject',
        {'subjectId': subjectId},
      );
}

/// Endpoint managing study tasks and completion status.
/// {@category Endpoint}
class EndpointTask extends _isc.EndpointRef {
  EndpointTask(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'task';

  /// Fetches tasks. If [subjectId] is specified, filters by that subject.
  _ida.Future<List<_idi7gx7k.StudyTask>> getTasks({
    int? subjectId,
    bool? isCompleted,
  }) => caller.callServerEndpoint<List<_idi7gx7k.StudyTask>>(
    'task',
    'getTasks',
    {
      'subjectId': subjectId,
      'isCompleted': isCompleted,
    },
  );

  /// Creates a new study task.
  _ida.Future<_idi7gx7k.StudyTask> createTask({
    required int subjectId,
    required String title,
    String? notes,
    required _isgah3pl.TaskPriority priority,
    required int estimatedMinutes,
    DateTime? dueDate,
  }) => caller.callServerEndpoint<_idi7gx7k.StudyTask>(
    'task',
    'createTask',
    {
      'subjectId': subjectId,
      'title': title,
      'notes': notes,
      'priority': priority,
      'estimatedMinutes': estimatedMinutes,
      'dueDate': dueDate,
    },
  );

  /// Toggles task completion state.
  _ida.Future<_idi7gx7k.StudyTask?> toggleTaskCompletion(int taskId) =>
      caller.callServerEndpoint<_idi7gx7k.StudyTask?>(
        'task',
        'toggleTaskCompletion',
        {'taskId': taskId},
      );

  /// Deletes a task by id.
  _ida.Future<bool> deleteTask(int taskId) => caller.callServerEndpoint<bool>(
    'task',
    'deleteTask',
    {'taskId': taskId},
  );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _iaic.Caller(client);
    serverpod_auth_core = _iacc.Caller(client);
  }

  late final _iaic.Caller serverpod_auth_idp;

  late final _iacc.Caller serverpod_auth_core;
}

class Client extends _isc.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _isc.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_isc.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
    _i85jenna.Client? httpClientOverride,
  }) : super(
         host,
         _il2as5qe.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
         httpClientOverride: httpClientOverride,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    greeting = EndpointGreeting(this);
    dashboard = EndpointDashboard(this);
    focusSession = EndpointFocusSession(this);
    subject = EndpointSubject(this);
    task = EndpointTask(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointGreeting greeting;

  late final EndpointDashboard dashboard;

  late final EndpointFocusSession focusSession;

  late final EndpointSubject subject;

  late final EndpointTask task;

  late final Modules modules;

  @override
  Map<String, _isc.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'greeting': greeting,
    'dashboard': dashboard,
    'focusSession': focusSession,
    'subject': subject,
    'task': task,
  };

  @override
  Map<String, _isc.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
