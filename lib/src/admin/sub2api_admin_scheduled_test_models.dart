import 'sub2api_admin_account_models.dart';

final class Sub2ApiAdminCreateScheduledTestPlanRequest {
  const Sub2ApiAdminCreateScheduledTestPlanRequest({
    required this.accountId,
    required this.cronExpression,
    this.modelId = '',
    this.enabled = true,
    this.maxResults = 50,
    this.autoRecover = false,
  });

  final int accountId;
  final String modelId;
  final String cronExpression;
  final bool enabled;
  final int maxResults;
  final bool autoRecover;
}

final class Sub2ApiAdminUpdateScheduledTestPlanRequest {
  const Sub2ApiAdminUpdateScheduledTestPlanRequest({
    this.modelId,
    this.cronExpression,
    this.enabled,
    this.maxResults,
    this.autoRecover,
  });

  final String? modelId;
  final String? cronExpression;
  final bool? enabled;
  final int? maxResults;
  final bool? autoRecover;
}

final class Sub2ApiAdminScheduledTestResult {
  const Sub2ApiAdminScheduledTestResult({
    required this.id,
    required this.planId,
    required this.status,
    required this.responseText,
    required this.errorMessage,
    required this.latency,
    required this.startedAt,
    required this.finishedAt,
    required this.createdAt,
  });

  final int id;
  final int planId;
  final String status;
  final String responseText;
  final String errorMessage;
  final Duration latency;
  final DateTime startedAt;
  final DateTime finishedAt;
  final DateTime createdAt;
}

final class Sub2ApiAdminDeleteScheduledTestPlanResult {
  const Sub2ApiAdminDeleteScheduledTestPlanResult(this.message);

  final String message;
}

typedef Sub2ApiAdminScheduledTestPlanResult = Sub2ApiAdminScheduledTestPlan;
