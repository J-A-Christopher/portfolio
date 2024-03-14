import 'package:equatable/equatable.dart';

class ServicesEntity extends Equatable{
 const ServicesEntity(
      {this.createdAt,
      this.id,
      this.serviceDescription,
      this.serviceImageUrl,
      this.serviceTitle,
      this.updatedAt});
  final int? id;
  final String? serviceTitle;
  final String? serviceImageUrl;
  final String? serviceDescription;
  final String? createdAt;
  final String? updatedAt;
  
  @override
  List<Object?> get props => [id, serviceTitle, serviceImageUrl,serviceDescription, createdAt, updatedAt];

}
