import 'dart:async';

import 'package:http/http.dart' as http;

const _baseUri = 'dog.ceo';

class DogCEOAPI {
  static Map<String, String>? _headers;

  static Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return http
        .get(
          Uri.https(_baseUri, path, queryParameters),
          headers: _headers,
        )
        .timeout(const Duration(seconds: 5));
  }
}
