import 'dart:io';

import 'package:dio/dio.dart';

import 'backend-error.dart';

typedef AppHttpClientErrorHandler = void Function(BackendError e);

class AppHttpClient {
  AppHttpClient(this.baseBackendUrl, String? apiVersion,
      {String? accessToken}) {
    backendApiUrl = '$baseBackendUrl/api';
    _client.options.baseUrl = backendApiUrl!;
    this.accessToken = accessToken ?? "";
    _client.options.headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };
  }

  final Dio _client = Dio();
  final String baseBackendUrl;
  String? backendApiUrl;
  final List<AppHttpClientErrorHandler> errorHandlers = [];
  String? _accessToken;
  CancelToken? cancelToken;

  set accessToken(String? accessToken) {
    _accessToken = accessToken;
    if (accessToken != null) {
      _client.options.headers['Authorization'] = 'Bearer $accessToken';
    }
  }

  String get accessToken {
    return _accessToken ?? "";
  }

  Map<String, String> get authHeaders {
    return {'Authorization': 'Bearer $accessToken'};
  }

  Future<T?> get<T>(String uri,
      {Map<String, dynamic>? params,
      Options? options,
      CancelToken? cancelToken}) {
    return _client
        .get<T>(uri,
            queryParameters: params, options: options, cancelToken: cancelToken)
        .catchError((e) => _handleError(e))
        .then((response) {
      return response.data;
    });
  }
  Future<T?> postd<T>(String uri,
      {required  FormData payload,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onUploadProgress,
        ProgressCallback? onReceiveProgress}) {
    return _client
        .post<T>(uri,
        data: payload,
        onSendProgress: onUploadProgress,
        onReceiveProgress: onReceiveProgress,
        options: options,
        cancelToken: cancelToken)
        .catchError((e) => _handleError(e))
        .then((response) {
      print(response);
      print(response.data);
      return response.data;
    });
  }
  Future<T?> post<T>(String uri,
      { dynamic payload,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onUploadProgress,
      ProgressCallback? onReceiveProgress}) {
    return _client
        .post<T>(uri,
            data: payload,
            onSendProgress: onUploadProgress,
            onReceiveProgress: onReceiveProgress,
            options: options,
            cancelToken: cancelToken)
        .catchError((e) => _handleError(e))
        .then((response) {
          print(response);
      print(response.data);
      return response.data;
    });
  }

  Future<T> put<T>(String uri, payload) {
    //payload = _spoofHttpMethod('PUT', payload);

    return _client
        .put<T>(uri, data: payload)
        .catchError((e) => _handleError(e))
        .then((response) {
      print(response.data!);
      return response.data!;
    });
  }

  Future<T> delete<T>(String uri, payload) {
    //payload = _spoofHttpMethod('DELETE', payload);
    return _client
        .delete<T>(uri, data: payload)
        .catchError((e) => _handleError(e))
        .then((response) => response.data!);
  }

  Future<dynamic> download(String url, String savePath, CancelToken cancelToken,
      ProgressCallback callback) {
    return _client
        .download(url, savePath,
            onReceiveProgress: callback, cancelToken: cancelToken)
        .catchError((e) => _handleError(e));
  }

  prefixUrl(String url) {
    if (url.contains('://') ||
        url.startsWith(baseBackendUrl) ||
        url.startsWith('api')) {
      return url;
    }
    return '$baseBackendUrl/$url';
  }

  setErrorHandler(AppHttpClientErrorHandler handler) {
    errorHandlers.add(handler);
  }

  _spoofHttpMethod(String method, Map original) {
    final payload = Map<String, dynamic>.from(original);
    payload['_method'] = method;
    return payload;
  }

  _handleError(DioError e) {
    print("error handler");
    print(e.message);
    print(e.error);
    print(e.requestOptions);
    print(e.type);
    print(e.response?.data);

    final backendError = BackendError(dioError: e);
    for (var handler in errorHandlers) {
      handler(backendError);
    }
    //cancelToken = null;
    throw (backendError);
  }
}
