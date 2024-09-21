import 'package:ERC/features/domain/entities/patient_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/entities/app_error.dart';

abstract class MainRepository {
  Future<Either<AppError, PatientEntity>> getCurrentPatient();

  Future<Either<AppError, PatientEntity>> getPatientById(String id);

  Future<Either<AppError, List<PatientEntity>>> getPatients();
}
