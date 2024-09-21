import 'package:ERC/features/domain/entities/doctor_entity.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class DoctorModel extends EcrEntity {
  @HiveField(0)
  final String id;

  DoctorModel({
    required this.id,
  }) : super(
          id: id,
        );
  factory DoctorModel.fromEntity(EcrEntity entity) {
    return DoctorModel(
      id: entity.id,
    );
  }

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
