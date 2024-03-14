import 'package:equatable/equatable.dart';

class WhatsNewEntity extends Equatable {
  final int? id;
  final String? projectTitle;
  final String? projectSubTitle;
  final String? projectDescription;
  final String? createdAt;
  final String? updatedAt;
  const WhatsNewEntity(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.projectTitle,
      this.projectSubTitle,
      this.projectDescription});

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        projectTitle,
        projectSubTitle,
        projectDescription
      ];
}
