import 'dart:io';
import 'package:ERC/features/data/datasource/main_remote_data_source.dart';
import 'package:ERC/features/domain/entities/patient_entity.dart';
import 'package:ERC/features/domain/repositories/main_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api/api_exceptions.dart';
import '../../../../core/entities/app_error.dart';

class MainRepositoryImpl extends MainRepository {
  final MainRemoteDataSource _remoteDataSource;

  MainRepositoryImpl(
    this._remoteDataSource,
  );

  @override
  Future<Either<AppError, PatientEntity>> getCurrentPatient() async {
    try {
      final data = await _remoteDataSource.getCurrentPatient();
      return Right(data);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on UnauthorisedException {
      return const Left(AppError(appErrorType: AppErrorType.unauthorised));
    } on ExceptionWithMessage catch (e) {
      return Left(
        AppError(
          appErrorType: AppErrorType.msgError,
          errorMessage: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<AppError, PatientEntity>> getPatientById(String id) async {
    try {
      final data = await _remoteDataSource.getPatientById(id);
      return Right(data);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on UnauthorisedException {
      return const Left(AppError(appErrorType: AppErrorType.unauthorised));
    } on ExceptionWithMessage catch (e) {
      return Left(
        AppError(
          appErrorType: AppErrorType.msgError,
          errorMessage: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<AppError, List<PatientEntity>>> getPatients() async {
    try {
      final data = await _remoteDataSource.getPatients();
      return Right(data);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on UnauthorisedException {
      return const Left(AppError(appErrorType: AppErrorType.unauthorised));
    } on ExceptionWithMessage catch (e) {
      return Left(
        AppError(
          appErrorType: AppErrorType.msgError,
          errorMessage: e.message,
        ),
      );
    }
  }
}
