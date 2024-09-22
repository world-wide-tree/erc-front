import 'package:ERC/core/api/api_client.dart';
import 'package:ERC/features/data/datasource/authentication_local_data_source.dart';
import 'package:ERC/features/data/datasource/authentication_remote_data_source.dart';
import 'package:ERC/features/data/datasource/main_remote_data_source.dart';
import 'package:ERC/features/domain/usecases/main.dart';
import 'package:ERC/features/presentation/cubit/doctor/doctor_cubit.dart';
import 'package:ERC/features/presentation/cubit/patient/patient_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

@pragma("vm:entry-point")
Future<void> init() async {
  // --------------------usecases------------------- //

  getItInstance.registerLazySingleton<PatientByIdFetched>(
      () => PatientByIdFetched(getItInstance()));
  getItInstance.registerLazySingleton<GetCurrentPatient>(
      () => GetCurrentPatient(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPatients>(() => GetPatients(getItInstance()));
  // -------------------------datasources------------------ //

  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());
  getItInstance.registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(getItInstance()));

  // ---------------------repository------------------- //

  // ---------------------core----------------------- //

  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(
      () => ApiClient(getItInstance(), getItInstance()));

  // ---------------------external-------------------- //

  // ----------------------BLoC / Cubit ------------- //

  // ----------------services---------------- //

  // getItInstance.registerSingleton(() => StorageService());
}
