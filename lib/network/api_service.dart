import 'package:demo_flutter/network/api_error.dart';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

import 'api_enum.dart';
import 'end_points/api_interface.dart';

class ApiHelper {
  static const Duration timeoutDuration = Duration(seconds: 60);
  static const RetryOptions retryOptions = RetryOptions(maxAttempts: 2);

  static Future<http.Response> apiGet(String url) async {
    return retryOptions.retry(() async {
      final headers = ApiHeaders.getHeaders();
      final modifiedUrl =
          ApiHeaders.addApiKeyToUrl(url); // Include API key in URL
      final response = await _performHttpCall(
        () => http.get(modifiedUrl, headers: headers),
      ).timeout(
        timeoutDuration,
        onTimeout: () => throw ApiCallError.timeout(),
      );

      if (response.statusCode == 409) {
        final callFailure = ApiCallError.callFailure(response);
        if (callFailure is UnauthorizedCallFailure) {
          throw UnauthorizedException(callFailure);
        }
      }

      return _returnResponse(response);
    }, retryIf: (e) async {
      return false;
    });
  }

  static Future<http.Response> apiPost(String url, String json) async {
    return retryOptions.retry(() async {
      final headers = ApiHeaders.getHeaders();

      final response = await _performHttpCall(
              () => http.post(Uri.parse(url), headers: headers, body: json))
          .timeout(timeoutDuration,
              onTimeout: () => throw ApiCallError.timeout());
      if (response.statusCode == 409) {
        throw ApiCallError.callFailure(response);
      }

      return _returnResponse(response);
    }, retryIf: (e) async {
      return false;
    });
  }

  static Future<http.Response> apiGetWithQueryParam(String url,
      {Map<String, dynamic>? queryParams}) async {
    return retryOptions.retry(() async {
      final headers = ApiHeaders.getHeaders();
      final modifiedUrl = ApiHeaders.addApiKeyToUrl(url);
      final String urlWithParams =
          modifiedUrl.replace(queryParameters: queryParams ?? {}).toString();

      final response = await _performHttpCall(
        () => http.get(Uri.parse(urlWithParams), headers: headers),
      ).timeout(
        timeoutDuration,
        onTimeout: () => throw ApiCallError.timeout(),
      );

      if (response.statusCode == 409) {
        final callFailure = ApiCallError.callFailure(response);
        if (callFailure is UnauthorizedCallFailure) {
          throw UnauthorizedException(callFailure);
        }
      }

      return _returnResponse(response);
    }, retryIf: (e) async {
      return false;
    });
  }

  static Future<http.Response> _performHttpCall(
      Future<http.Response> Function() httpCall) async {
    try {
      final response = await httpCall();
      return response;
    } catch (error) {
      throw ApiCallError.failure(ApiError(errorMessage: error.toString()));
    }
  }

  static Future<http.Response> _returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        return response;
      default:
        return response;
    }
  }
}
