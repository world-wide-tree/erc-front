import 'package:ERC/core/entities/no_params.dart';
import 'package:ERC/features/domain/entities/patient_entity.dart';
import 'package:ERC/features/domain/usecases/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'doctor_state.dart';

class ErCardCubit extends Cubit<ErCardState> {
  final GetPatients getPatients;
  final GetPatientById getPatientById;
  ErCardCubit({required this.getPatients, required this.getPatientById})
      : super(DoctorInitialState());

  getPatientsList() async {
    emit(DoctorLoadingState());
    final data = await getPatients(NoParams());

    data.fold(
      (l) {
        emit(DoctorErrorState(l.errorMessage));
      },
      (r) {
        emit(PatientsListFetchedState(r));
      },
    );
  }

  getPatientByPatientId(String id) async {
    emit(DoctorLoadingState());
    final data = await getPatientById(id);

    data.fold((l) {
      emit(DoctorErrorState(l.errorMessage));
    }, (r) {
      emit(PatientByIdFetched(r));
    });
  }
}
