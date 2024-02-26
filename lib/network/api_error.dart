import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_enum.dart';

abstract class ApiCallError {
  factory ApiCallError.timeout() => const ApiTimeout();

  factory ApiCallError.failure(ApiError error) => ApiFailure(error);

  factory ApiCallError.callFailure(http.Response response) {
    if (response.statusCode == 409) {
      return UnauthorizedCallFailure(response);
    }
    return ApiCallFailure(response);
  }

  const ApiCallError();
}

class ApiTimeout extends ApiCallError {
  const ApiTimeout();

  @override
  String toString() {
    return 'Api Timeout';
  }
}

class UnauthorizedCallFailure extends ApiCallError {
  final http.Response response;
  const UnauthorizedCallFailure(this.response);

  @override
  String toString() {
    final dynamic dataResponse = jsonDecode(response.body);
    final responseData = dataResponse;
    return '${responseData.message}';
  }
}

class UnauthorizedException implements Exception {
  final UnauthorizedCallFailure data;

  UnauthorizedException(this.data);
}

class ApiFailure extends ApiCallError {
  final ApiError error;

  const ApiFailure(this.error);

  @override
  String toString() {
    return error.errorMessage ?? "Something went wrong!";
  }
}

class ApiCallFailure extends ApiCallError {
  final http.Response response;

  ApiCallFailure(this.response);

  @override
  String toString() {
    return 'Status Code: ${response.statusCode}';
  }
}

ErrorException getErrorFromException(dynamic err) {
  if (err is ApiTimeout) {
    return const ErrorException(key: 'ApiTimeout', message: 'Api call timed-out');
  } else if (err is ApiCallFailure) {
    return ErrorException(key: err.response.statusCode.toString(), message: err.toString());
  } else if (err is ErrorException) {
    return ErrorException(
        key: err.message.toString(),message: err.message.toString());
  } else if (err is ArgumentError) {
    return const ErrorException(
        key: "", message: "Network error, Please try again");
  } else if (err is UnimplementedError) {
    return ErrorException(key: err.toString(), message: err.message.toString());
  } else if (err is TypeError) {
    return ErrorException(key: err.toString(), message: err.toString());
  } else {
    return ErrorException(key: err.toString(), message: err.toString());
  }
}