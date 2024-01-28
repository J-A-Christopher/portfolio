import 'package:equatable/equatable.dart';
import 'package:portfolio/features/welcomeCard/domain/entities/aboume_entity.dart';

class AboutMeModel extends AboutMeEntity with EquatableMixin {
  int? id;
  String? name;
  String? bio;
  String? skills;
  String? createdAt;
  String? updatedAt;

  AboutMeModel(
      {this.id,
      this.name,
      this.bio,
      this.skills,
      this.createdAt,
      this.updatedAt});

  AboutMeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bio = json['bio'];
    skills = json['skills'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['bio'] = this.bio;
    data['skills'] = this.skills;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}