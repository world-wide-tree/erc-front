part of 'patient_cubit.dart';

abstract class ErCardState {}

class PatientInitialState extends ErCardState {}

class PatientLoadingState extends ErCardState {}

class PatientErrorState extends ErCardState {
  final String message;

  PatientErrorState(this.message);
}

class CurrentPatientFetched extends ErCardState {
  final PatientEntity patient;

  CurrentPatientFetched(this.patient);
}
