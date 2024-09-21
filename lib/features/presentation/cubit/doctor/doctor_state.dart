part of 'doctor_cubit.dart';

abstract class ErCardState {}

class DoctorInitialState extends ErCardState {}

class PatientsListFetchedState extends ErCardState {
  final List<PatientEntity> patients;

  PatientsListFetchedState(this.patients);
}

class DoctorLoadingState extends ErCardState {}

class DoctorErrorState extends ErCardState {
  final String message;

  DoctorErrorState(this.message);
}

class PatientByIdFetched extends ErCardState {
  final PatientEntity patient;

  PatientByIdFetched(this.patient);
}
