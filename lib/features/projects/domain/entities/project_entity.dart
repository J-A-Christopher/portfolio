import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  const ProjectEntity(
      {this.createdAt,
      this.description,
      this.id,
      this.imageUrl,
      this.projectName,
      this.updatedAt, this.projUrl});
  final int? id;
  final String? projectName;
  final String? description;
  final String? imageUrl;
  final String? createdAt;
  final String? updatedAt;
  final String? projUrl;

  @override
  List<Object?> get props =>
      [id, projectName, description, imageUrl, createdAt, updatedAt];
}
