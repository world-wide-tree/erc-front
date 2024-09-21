import 'package:ERC/features/domain/entities/ecr_entity.dart';
import 'package:ERC/features/domain/entities/patient_entity.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class PatientModel extends PatientEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String pol;
  @HiveField(4)
  final EcrEntity ecr;

  PatientModel({
    required this.id,
    required this.name,
    required this.age,
    required this.pol,
    required this.ecr,
  }) : super(
          id: id,
          name: name,
          age: age,
          pol: pol,
          ecr: ecr,
        );
  factory PatientModel.fromEntity(PatientEntity entity) {
    return PatientModel(
      id: entity.id,
      name: entity.name,
      age: entity.age,
      pol: entity.pol,
      ecr: entity.ecr,
    );
  }

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      age: json['age'] ?? '',
      pol: json['pol'] ?? '',
      ecr: json['ecr'] ?? EcrEntity(id: ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'pol': pol,
      'ecr': ecr,
    };
  }
}
