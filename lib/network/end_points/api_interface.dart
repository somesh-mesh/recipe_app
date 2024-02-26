import 'package:demo_flutter/utils/constant_strings.dart';

class ApiHeaders {
  static Map<String, String> getHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "HttpHeaders.contentTypeHeader": "application/json",
      "Connection": "keep-alive",
    };
    return headers;
  }

  static Uri addApiKeyToUrl(String url) {
    final modifiedUrl = Uri.parse(url).replace(queryParameters: {'apiKey': ConstantString.apiKey});
    return modifiedUrl;
  }
}
