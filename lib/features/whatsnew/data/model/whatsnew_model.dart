import 'package:equatable/equatable.dart';
import 'package:portfolio/features/whatsnew/domain/entity/whatsnew_entity.dart';

class WhatsNewModel extends WhatsNewEntity with EquatableMixin{
  final int? id;
  final String? projectTitle;
  final String? projectSubTitle;
  final String? projectDescription;
  final String? createdAt;
  final String? updatedAt;

  WhatsNewModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.projectTitle,
      required this.projectSubTitle,
      required this.projectDescription});

  factory WhatsNewModel.fromJson(Map<String, dynamic> json) {
    return WhatsNewModel(
        id: json['id'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        projectTitle: json['projectTitle'],
        projectSubTitle: json['projectSubTitle'],
        projectDescription: json['projectDescription']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'projectTitle': projectTitle,
      'projectSubTitle': projectSubTitle,
      'projectDescription': projectDescription
    };
  }
}
