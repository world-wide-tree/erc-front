import 'package:equatable/equatable.dart';

class EcrEntity extends Equatable {
  final String id;
  const EcrEntity({required this.id});
  @override
  List<Object> get props => [
        id,
      ];
}
