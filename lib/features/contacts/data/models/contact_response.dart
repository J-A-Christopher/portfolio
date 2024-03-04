import 'package:equatable/equatable.dart';
import 'package:portfolio/features/contacts/domain/entities/contact_info_entity.dart';

class ContactResponse extends ContactInfoEntity with EquatableMixin {
  int? id;
  String? name;
  String? email;
  String? service;
  String? message;
  String? updatedAt;
  String? createdAt;

  ContactResponse(
      {this.id,
      this.name,
      this.email,
      this.service,
      this.message,
      this.updatedAt,
      this.createdAt});

  ContactResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    service = json['service'];
    message = json['message'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['service'] = this.service;
    data['message'] = this.message;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}