import 'package:equatable/equatable.dart';
import '../../domain/entity/service_entity.dart';

class ServicesModel extends ServicesEntity with EquatableMixin{
  ServicesModel(
      {required this.createdAt,
      required this.id,
      required this.serviceDescription,
      required this.serviceImageUrl,
      required this.serviceTitle,
      required this.updatedAt});
  final int? id;
  final String? serviceTitle;
  final String? serviceImageUrl;
  final String? serviceDescription;
  final String? createdAt;
  final String? updatedAt;

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
        createdAt: json['createdAt'],
        id: json['id'],
        serviceDescription: json['serviceDescription'],
        serviceImageUrl: json['serviceImageUrl'],
        serviceTitle: json['serviceTitle'],
        updatedAt: json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "serviceTitle": serviceTitle,
      "serviceDescription": serviceDescription,
      "createdAt": createdAt,
      "updatedAt": updatedAt
    };
  }
  
  @override
 
  List<Object?> get props => [id, serviceTitle,serviceImageUrl ,serviceDescription, createdAt, updatedAt];
}
