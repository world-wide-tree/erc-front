class UnauthorisedException implements Exception {}

class ExceptionWithMessage implements Exception {
  final String message;
  const ExceptionWithMessage(this.message);
}
