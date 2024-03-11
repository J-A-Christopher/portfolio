import 'package:equatable/equatable.dart';
import 'package:portfolio/features/resume/domain/entities/resume_entity.dart';

class ResumeModel  extends ResumeEntity with EquatableMixin{
  ResumeModel(
      {required this.id,
      required this.resumeUrl,
      required this.createdAt,
      required this.updatedAt});
  final int? id;
  final String? resumeUrl;
  final String? createdAt;
  final String? updatedAt;

  factory ResumeModel.fromJson(Map<String, dynamic> json) {
    return ResumeModel(
        id: json['id'],
        resumeUrl: json['resumeString'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      "resumeString":resumeUrl,
      "createdAt":createdAt,
      "updatedAt":updatedAt
    };
  }
}
