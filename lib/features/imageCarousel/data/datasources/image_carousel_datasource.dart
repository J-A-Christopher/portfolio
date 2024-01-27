import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/features/imageCarousel/data/models/image_carousel_model.dart';
import 'package:portfolio/features/imageCarousel/data/exceptions/exception.dart';

///abstract class [ImageDataSource]
abstract class ImageDataSource {
  Future<List<ImageCarouselModel>> getCarouselData();
}

///ImageDataSource implementation
@Injectable(as: ImageDataSource)
class ImageDataSourceImpl implements ImageDataSource {
  final dio = Dio();
  @override
  Future<List<ImageCarouselModel>> getCarouselData() async {
    const url = 'http://10.0.2.2:8080/portfolio/tour-data';
    final Response response = await dio.get(url);
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      List<ImageCarouselModel> imageData = [];
      for (var imageInfo in response.data) {
        var imageObject = ImageCarouselModel.fromJson(imageInfo);
        imageData.add(imageObject);
      }
      print(imageData);
      return imageData;
    }
  }
}
