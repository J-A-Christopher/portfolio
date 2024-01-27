import 'package:equatable/equatable.dart';

class CarouselImageEntity extends Equatable {
  final int? id;

  ///imgDesc
  final String? imgDescription;

  ///imgurl
 final String? imgUrl;

  ///createdat
  final String? createdAt;

  ///updatedAt
  final String? updatedAt;

  const CarouselImageEntity({
      this.createdAt,
      this.id,
      this.imgDescription,
      this.imgUrl,
      this.updatedAt});

  @override
  List<Object?> get props => [createdAt, id, imgDescription, imgUrl, updatedAt];
}
