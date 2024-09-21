import 'package:ERC/features/domain/entities/doctor_entity.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class EcrModel extends EcrEntity {
  @HiveField(0)
  final String id;

  EcrModel({
    required this.id,
  }) : super(
          id: id,
        );
  factory EcrModel.fromEntity(EcrEntity entity) {
    return EcrModel(
      id: entity.id,
    );
  }

  factory EcrModel.fromJson(Map<String, dynamic> json) {
    return EcrModel(
      id: json['id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
