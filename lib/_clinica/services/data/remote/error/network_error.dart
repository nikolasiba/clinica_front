class NetworkException implements Exception {
  final dynamic message;
  final dynamic prefix;

  NetworkException([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends NetworkException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends NetworkException {
  BadRequestException([message]) : super(message, "");
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException([message]) : super(message, "");
}

class InvalidInputException extends NetworkException {
  InvalidInputException([String? message]) : super(message, "");
}

class BadGateway extends NetworkException {
  BadGateway([String? message]) : super(message, "");
}
