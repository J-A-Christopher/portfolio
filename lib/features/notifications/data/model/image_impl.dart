import 'package:equatable/equatable.dart';
import 'package:portfolio/features/notifications/domain/entity/image_ent.dart';

class ImageGottenModel extends OfficePictureEntity  with EquatableMixin {
  ImageGottenModel(
      {required String? createdAt,
      required int? id,
      required String? updatedAt,
      required String? imageUrl})
      : super(
            createdAt: createdAt,
            id: id,
            imageUrl: imageUrl,
            updatedAt: updatedAt);

  // ImageGottenModel(
  // {required this.createdAt,
  // required this.id,
  // required this.updatedAt,
  // required this.imageUrl});
  // @override
  // final int? id;
  // @override
  // final String? createdAt;
  // @override
  // final String? updatedAt;
  // @override
  // final String? imageUrl;

  factory ImageGottenModel.fromJson(Map<String, dynamic> json) {
    return ImageGottenModel(
        createdAt: json['createdAt'],
        id: json['id'],
        updatedAt: json['updatedAt'],
        imageUrl: json['imageString']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "imageUrl": imageUrl
    };
  }
  
}
