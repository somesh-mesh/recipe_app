class ApiError{
  String? errorCode;
  String? errorMessage;

  ApiError({
    String? errorCode,
    String? errorMessage
  });
}

class ErrorException {
  final String key;
  final String message;

  const ErrorException({
    required this.key,
    required this.message
  });

  @override
  String toString() {
    return message;
  }
}