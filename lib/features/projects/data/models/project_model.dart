import 'package:equatable/equatable.dart';
import 'package:portfolio/features/projects/domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity with EquatableMixin {
  ProjectModel(
      {required this.createdAt,
      required this.description,
      required this.id,
      required this.imageUrl,
      required this.projectName,
      required this.updatedAt, required this.projUrl});
  final int? id;
  final String? projectName;
  final String? description;
  final String? imageUrl;
  final String? createdAt;
  final String? updatedAt;
  final String? projUrl;

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
        createdAt: json['createdAt'],
        description: json['desccription'],
        id: json['id'],
        imageUrl: json['imageUrl'],
        projectName: json['projectName'],
        updatedAt: json['updatedAt'],
        projUrl:json['url']
        );
        
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectName': projectName,
      'desccription': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'url':projUrl
    };
  }
}
