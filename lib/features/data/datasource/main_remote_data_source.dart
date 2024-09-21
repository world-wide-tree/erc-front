import 'package:ERC/features/data/models/patient_model.dart';
import '../../../../core/api/api_client.dart';
import '../../../../core/api/api_constants.dart';

abstract class MainRemoteDataSource {
  Future<PatientModel> getCurrentPatient();

  Future<PatientModel> getPatientById(String id);

  Future<List<PatientModel>> getPatients();
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiClient _client;
  MainRemoteDataSourceImpl(
    this._client,
  );

  @override
  Future<PatientModel> getCurrentPatient() async {
    final response = await _client.get(ApiConstants.currentPatient);

    final user = PatientModel.fromJson(response);

    return user;
  }

  @override
  Future<PatientModel> getPatientById(String id) async {
    final response = await _client.get('${ApiConstants.patient}/${id}');

    final user = PatientModel.fromJson(response);

    return user;
  }

  @override
  Future<List<PatientModel>> getPatients() async {
    final response = await _client.get(ApiConstants.currentPatient);

    final user = await List.from(response)
        .map((json) => PatientModel.fromJson(json))
        .toList();

    return user;
  }
}
