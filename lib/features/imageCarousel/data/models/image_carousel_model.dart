
import 'package:equatable/equatable.dart';
import 'package:portfolio/features/imageCarousel/domain/entities/image_domain_entity.dart';

///[ImageCarouselModel] class
class ImageCarouselModel extends CarouselImageEntity with EquatableMixin {

  ///id field
  int? id;
  ///imgDesc
  String? imgDescription;
  ///imgurl
  String? imgUrl;
  ///createdat
  String? createdAt;
  ///updatedAt
  String? updatedAt;
///tojson method

///Our constructor
  ImageCarouselModel(
      this.id,
      this.imgDescription,
      this.imgUrl,
      this.createdAt,
      this.updatedAt);
///From json method
  ImageCarouselModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgDescription = json['imgDescription'];
    imgUrl = json['imgUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  
  Map<String, dynamic> toJson() {
    ///method mapper
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['imgDescription'] = this.imgDescription;
    data['imgUrl'] = this.imgUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}