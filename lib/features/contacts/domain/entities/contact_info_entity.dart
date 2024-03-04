import 'package:equatable/equatable.dart';

class ContactInfoEntity extends Equatable {
  const ContactInfoEntity(
      { this.createdAt,
       this.email,
       this.id,
       this.message,
       this.name,
       this.service,
       this.updatedAt});
  final int? id;
  final String? name;
  final String? email;
  final String? service;
  final String? message;
  final String? updatedAt;
  final String? createdAt;

  @override
  List<Object?> get props => [id,name,email, service, message, updatedAt, createdAt];
}
