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
import 'package:focus_flow_server/src/generated/planner/task_priority.dart'
    as _iy7t2uom;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import '../auth/email_idp_endpoint.dart' as _iuc1hd5t;
import '../auth/jwt_refresh_endpoint.dart' as _inwq3ztq;
import '../greetings/greeting_endpoint.dart' as _il624ik7;
import '../planner/dashboard_endpoint.dart' as _i9w5l55k;
import '../planner/focus_session_endpoint.dart' as _i4z8fhod;
import '../planner/subject_endpoint.dart' as _ifn1s4j6;
import '../planner/task_endpoint.dart' as _iwsqoezq;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'emailIdp': _iuc1hd5t.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _inwq3ztq.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'greeting': _il624ik7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'dashboard': _i9w5l55k.DashboardEndpoint()
        ..initialize(
          server,
          'dashboard',
          null,
        ),
      'focusSession': _i4z8fhod.FocusSessionEndpoint()
        ..initialize(
          server,
          'focusSession',
          null,
        ),
      'subject': _ifn1s4j6.SubjectEndpoint()
        ..initialize(
          server,
          'subject',
          null,
        ),
      'task': _iwsqoezq.TaskEndpoint()
        ..initialize(
          server,
          'task',
          null,
        ),
    };
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint).login(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _is.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['jwtRefresh'] as _inwq3ztq.JwtRefreshEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['greeting'] = _is.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _is.MethodConnector(
          name: 'hello',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['greeting'] as _il624ik7.GreetingEndpoint).hello(
                    session,
                    params['name'],
                  ),
        ),
      },
    );
    connectors['dashboard'] = _is.EndpointConnector(
      name: 'dashboard',
      endpoint: endpoints['dashboard']!,
      methodConnectors: {
        'getSummary': _is.MethodConnector(
          name: 'getSummary',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['dashboard'] as _i9w5l55k.DashboardEndpoint)
                  .getSummary(session),
        ),
      },
    );
    connectors['focusSession'] = _is.EndpointConnector(
      name: 'focusSession',
      endpoint: endpoints['focusSession']!,
      methodConnectors: {
        'recordSession': _is.MethodConnector(
          name: 'recordSession',
          params: {
            'subjectId': _is.ParameterDescription(
              name: 'subjectId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'taskId': _is.ParameterDescription(
              name: 'taskId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'durationMinutes': _is.ParameterDescription(
              name: 'durationMinutes',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'reflectionNotes': _is.ParameterDescription(
              name: 'reflectionNotes',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'productivityScore': _is.ParameterDescription(
              name: 'productivityScore',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'markTaskComplete': _is.ParameterDescription(
              name: 'markTaskComplete',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['focusSession'] as _i4z8fhod.FocusSessionEndpoint)
                      .recordSession(
                        session,
                        subjectId: params['subjectId'],
                        taskId: params['taskId'],
                        durationMinutes: params['durationMinutes'],
                        reflectionNotes: params['reflectionNotes'],
                        productivityScore: params['productivityScore'],
                        markTaskComplete: params['markTaskComplete'],
                      ),
        ),
        'getRecentSessions': _is.MethodConnector(
          name: 'getRecentSessions',
          params: {
            'limit': _is.ParameterDescription(
              name: 'limit',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['focusSession'] as _i4z8fhod.FocusSessionEndpoint)
                      .getRecentSessions(
                        session,
                        limit: params['limit'],
                      ),
        ),
      },
    );
    connectors['subject'] = _is.EndpointConnector(
      name: 'subject',
      endpoint: endpoints['subject']!,
      methodConnectors: {
        'getSubjects': _is.MethodConnector(
          name: 'getSubjects',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['subject'] as _ifn1s4j6.SubjectEndpoint)
                  .getSubjects(session),
        ),
        'createSubject': _is.MethodConnector(
          name: 'createSubject',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'colorHex': _is.ParameterDescription(
              name: 'colorHex',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'iconName': _is.ParameterDescription(
              name: 'iconName',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['subject'] as _ifn1s4j6.SubjectEndpoint)
                  .createSubject(
                    session,
                    name: params['name'],
                    colorHex: params['colorHex'],
                    iconName: params['iconName'],
                  ),
        ),
        'deleteSubject': _is.MethodConnector(
          name: 'deleteSubject',
          params: {
            'subjectId': _is.ParameterDescription(
              name: 'subjectId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['subject'] as _ifn1s4j6.SubjectEndpoint)
                  .deleteSubject(
                    session,
                    params['subjectId'],
                  ),
        ),
      },
    );
    connectors['task'] = _is.EndpointConnector(
      name: 'task',
      endpoint: endpoints['task']!,
      methodConnectors: {
        'getTasks': _is.MethodConnector(
          name: 'getTasks',
          params: {
            'subjectId': _is.ParameterDescription(
              name: 'subjectId',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'isCompleted': _is.ParameterDescription(
              name: 'isCompleted',
              type: _is.getType<bool?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['task'] as _iwsqoezq.TaskEndpoint).getTasks(
                session,
                subjectId: params['subjectId'],
                isCompleted: params['isCompleted'],
              ),
        ),
        'createTask': _is.MethodConnector(
          name: 'createTask',
          params: {
            'subjectId': _is.ParameterDescription(
              name: 'subjectId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'title': _is.ParameterDescription(
              name: 'title',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'notes': _is.ParameterDescription(
              name: 'notes',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'priority': _is.ParameterDescription(
              name: 'priority',
              type: _is.getType<_iy7t2uom.TaskPriority>(),
              nullable: false,
            ),
            'estimatedMinutes': _is.ParameterDescription(
              name: 'estimatedMinutes',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'dueDate': _is.ParameterDescription(
              name: 'dueDate',
              type: _is.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['task'] as _iwsqoezq.TaskEndpoint).createTask(
                    session,
                    subjectId: params['subjectId'],
                    title: params['title'],
                    notes: params['notes'],
                    priority: params['priority'],
                    estimatedMinutes: params['estimatedMinutes'],
                    dueDate: params['dueDate'],
                  ),
        ),
        'toggleTaskCompletion': _is.MethodConnector(
          name: 'toggleTaskCompletion',
          params: {
            'taskId': _is.ParameterDescription(
              name: 'taskId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['task'] as _iwsqoezq.TaskEndpoint)
                  .toggleTaskCompletion(
                    session,
                    params['taskId'],
                  ),
        ),
        'deleteTask': _is.MethodConnector(
          name: 'deleteTask',
          params: {
            'taskId': _is.ParameterDescription(
              name: 'taskId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['task'] as _iwsqoezq.TaskEndpoint).deleteTask(
                    session,
                    params['taskId'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeEndpoints(server);
  }
}
