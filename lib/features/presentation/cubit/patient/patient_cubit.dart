import 'package:ERC/core/entities/no_params.dart';
import 'package:ERC/features/domain/entities/patient_entity.dart';
import 'package:ERC/features/domain/usecases/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'patient_state.dart';

class ErCardCubit extends Cubit<ErCardState> {
  final GetCurrentPatient getCurrentPatient;
  ErCardCubit({required this.getCurrentPatient}) : super(PatientInitialState());

  fetchCurrentPatient() async {
    emit(PatientLoadingState());
    final data = await getCurrentPatient(NoParams());

    data.fold((l) {
      emit(PatientErrorState(l.errorMessage));
    }, (r) {
      emit(CurrentPatientFetched(r));
    });
  }
}
