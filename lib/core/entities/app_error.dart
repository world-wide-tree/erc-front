import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final AppErrorType appErrorType;
  final String errorMessage;
  const AppError({required this.appErrorType, this.errorMessage = ''});

  @override
  List<Object> get props => [appErrorType];
}

enum AppErrorType {
  api,
  network,
  database,
  unauthorised,
  sessionDenied,
  msgError,
  emailValidation
}
