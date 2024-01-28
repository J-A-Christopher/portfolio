import 'package:equatable/equatable.dart';

class AboutMeEntity extends Equatable{
   int? id;
  String? name;
  String? bio;
  String? skills;
  String? createdAt;
  String? updatedAt;

  AboutMeEntity(
      {this.id,
      this.name,
      this.bio,
      this.skills,
      this.createdAt,
      this.updatedAt});
      
        @override
       
        List<Object?> get props => [id, name, bio, skills, createdAt, updatedAt];
}