import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../shared/errors/sub2api_exception.dart';
import '../shared/request/sub2api_request_options.dart';
import '../shared/transport/request_executor.dart';
import 'sub2api_admin_credential_mode.dart';
import 'sub2api_admin_plugin_models.dart';
import 'wire/admin_plugin_wire_mapper.dart';
import 'wire/admin_plugin_wire_service.dart';

abstract interface class Sub2ApiAdminPluginsClient {
  Future<List<Sub2ApiAdminPlugin>> list({
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPlugin> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPlugin> upload(
    Sub2ApiAdminPluginPackage package, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPlugin> enable(
    int id, {
    Sub2ApiAdminEnablePluginRequest request =
        const Sub2ApiAdminEnablePluginRequest(),
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPlugin> disable(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPluginDeleteResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPluginConfig> getConfig(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPluginConfig> saveConfig(
    int id,
    Sub2ApiAdminPluginConfig config, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPluginTestResult> test(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
  Future<Sub2ApiAdminPluginUiSession> createUiSession(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  });
}

Sub2ApiAdminPluginsClient createSub2ApiAdminPluginsClient({
  required Dio dio,
  required Sub2ApiRequestExecutor requestExecutor,
  required Sub2ApiProtectedRawMutationExecutor rawMutationExecutor,
  required Sub2ApiAdminCredentialMode credentialMode,
}) => _Client(dio, requestExecutor, rawMutationExecutor, credentialMode);

final class _Client implements Sub2ApiAdminPluginsClient {
  _Client(Dio dio, this._executor, this._rawMutationExecutor, this._mode)
    : _service = AdminPluginWireService(dio);

  final Sub2ApiRequestExecutor _executor;
  final Sub2ApiProtectedRawMutationExecutor _rawMutationExecutor;
  final Sub2ApiAdminCredentialMode _mode;
  final AdminPluginWireService _service;

  @override
  Future<List<Sub2ApiAdminPlugin>> list({
    Sub2ApiRequestOptions? requestOptions,
  }) => _executor.protectedRequest(
    send: (cancelToken, options, credential) => _service.list(
      cancelToken,
      options,
      _authorization(credential),
      _apiKey(credential),
    ),
    decode: mapAdminPlugins,
    requestOptions: requestOptions,
  );

  @override
  Future<Sub2ApiAdminPlugin> get(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedRequest(
      send: (cancelToken, options, credential) => _service.get(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPlugin,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPlugin> upload(
    Sub2ApiAdminPluginPackage package, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _requireStepUpJwt();
    final filename = package.filename.trim();
    if (!filename.toLowerCase().endsWith('.s2plugin') ||
        filename.contains('/') ||
        filename.contains('\\') ||
        package.bytes.isEmpty) {
      throw _validation('admin.plugins.invalid_package');
    }
    final file = MultipartFile.fromBytes(package.bytes, filename: filename);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.upload(
        file,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPlugin,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPlugin> enable(
    int id, {
    Sub2ApiAdminEnablePluginRequest request =
        const Sub2ApiAdminEnablePluginRequest(),
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _requireStepUpJwt();
    _id(id);
    if (request.rolloutPercent < 1 || request.rolloutPercent > 100) {
      throw _validation('admin.plugins.invalid_rollout_percent');
    }
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.enable(
        id,
        <String, Object?>{
          'accept_untested': request.acceptUntested,
          'rollout_percent': request.rolloutPercent,
        },
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPlugin,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPlugin> disable(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) => _stepUpPluginMutation(id, _service.disable, requestOptions);

  @override
  Future<Sub2ApiAdminPluginDeleteResult> delete(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _requireStepUpJwt();
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.delete(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPluginDelete,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPluginConfig> getConfig(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedRequestAllowingRawSuccess(
      send: (cancelToken, options, credential) => _service.config(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPluginConfig,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPluginConfig> saveConfig(
    int id,
    Sub2ApiAdminPluginConfig config, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _requireStepUpJwt();
    _id(id);
    final value = config.reveal().toWire();
    if (value is! Map<String, Object?>) {
      throw _validation('admin.plugins.invalid_config');
    }
    return _rawMutationExecutor.protectedNonReplayableRequestAllowingRawSuccess(
      send: (cancelToken, options, credential) => _service.saveConfig(
        id,
        value,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPluginConfig,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPluginTestResult> test(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _requireStepUpJwt();
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.test(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPluginTest,
      requestOptions: requestOptions,
    );
  }

  @override
  Future<Sub2ApiAdminPluginUiSession> createUiSession(
    int id, {
    Sub2ApiRequestOptions? requestOptions,
  }) {
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => _service.uiSession(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPluginUiSession,
      requestOptions: requestOptions,
    );
  }

  Future<Sub2ApiAdminPlugin> _stepUpPluginMutation(
    int id,
    Future<HttpResponse<Object?>> Function(
      int,
      CancelToken,
      Options,
      String?,
      String?,
    )
    send,
    Sub2ApiRequestOptions? requestOptions,
  ) {
    _requireStepUpJwt();
    _id(id);
    return _executor.protectedNonReplayableRequest(
      send: (cancelToken, options, credential) => send(
        id,
        cancelToken,
        options,
        _authorization(credential),
        _apiKey(credential),
      ),
      decode: mapAdminPlugin,
      requestOptions: requestOptions,
    );
  }

  void _requireStepUpJwt() {
    if (_mode == Sub2ApiAdminCredentialMode.apiKey) {
      throw _stepUpAdminApiKeyForbidden;
    }
  }

  String? _authorization(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.jwt ? credential : null;
  String? _apiKey(String? credential) =>
      _mode == Sub2ApiAdminCredentialMode.apiKey ? credential : null;
}

void _id(int id) {
  if (id <= 0) throw _validation('admin.plugins.invalid_id');
}

Sub2ApiException _validation(String code) => Sub2ApiException(
  kind: Sub2ApiFailureKind.validation,
  code: code,
  retryable: false,
);

const _stepUpAdminApiKeyForbidden = Sub2ApiException(
  kind: Sub2ApiFailureKind.forbidden,
  code: 'auth.step_up_admin_api_key_forbidden',
  retryable: false,
);
