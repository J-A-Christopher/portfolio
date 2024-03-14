import 'package:equatable/equatable.dart';

class OfficePictureEntity extends Equatable {
  const OfficePictureEntity(
      {this.createdAt, this.id, this.imageUrl, this.updatedAt});
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String? imageUrl;

  @override
  List<Object?> get props => [id, createdAt, updatedAt, imageUrl];
}
