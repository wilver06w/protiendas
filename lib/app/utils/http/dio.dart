import 'dart:io';

import 'package:dio/dio.dart';

/// YuGiOhSharedDio
///
/// YuGiOh shared dio
///
/// This class will help us to manage every dio http request to our Verifik
/// api exposed
///
/// By defualt
class YuGiOhSharedDio {
  YuGiOhSharedDio({
    /// only for test, this value for test should be a mock
    Dio? dioInstance,
    required String baseUrl,
  }) {
    _dioInstance = dioInstance ?? Dio()
      ..options.baseUrl = baseUrl
      ..options.followRedirects = false;

    _addHeaders();
  }

  late Dio _dioInstance;

  /// This property is a value in Http request headers.

  Dio get dio => _dioInstance;

  ///This method add new headers to `Http request headers`
  ///

  void _addHeaders() {
    _dioInstance.options.headers = {
      Headers.contentTypeHeader: Headers.jsonContentType,
      Headers.acceptHeader: Headers.jsonContentType,
      HttpHeaders.acceptEncodingHeader: 'gzip',
    };
  }
}
