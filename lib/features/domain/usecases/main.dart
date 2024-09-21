import 'package:ERC/features/domain/entities/patient_entity.dart';
import 'package:ERC/features/domain/repositories/main_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/entities/app_error.dart';
import '../../../../core/entities/no_params.dart';
import '../../../../core/usecases/usecase.dart';

class GetCurrentPatient extends UseCase<PatientEntity, NoParams> {
  final MainRepository _mainRepository;

  GetCurrentPatient(this._mainRepository);

  @override
  Future<Either<AppError, PatientEntity>> call(NoParams params) async {
    return await _mainRepository.getCurrentPatient();
  }
}

class GetPatientById extends UseCase<PatientEntity, String> {
  final MainRepository _mainRepository;

  GetPatientById(this._mainRepository);

  @override
  Future<Either<AppError, PatientEntity>> call(String params) async {
    return await _mainRepository.getPatientById(params);
  }
}

class GetPatients extends UseCase<List<PatientEntity>, NoParams> {
  final MainRepository _mainRepository;
  GetPatients(this._mainRepository);

  @override
  Future<Either<AppError, List<PatientEntity>>> call(NoParams params) async {
    return await _mainRepository.getPatients();
  }
}
