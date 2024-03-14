import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/constants/constants.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/features/notifications/data/model/image_impl.dart';

abstract class GetImageString {
  Future<ImageGottenModel> getImage();
}

@Injectable(as: GetImageString)
class ImageDataSourceImpl implements GetImageString {
  @override
  Future<ImageGottenModel> getImage() async {
    final dio = Dio();
    const imageUrl = '$baseServerUrl/office-image';
    Response response = await dio.get(imageUrl);
    if (response.statusCode == 200) {
      response.data['data'];
      final image = (response.data['data'] as List).first;
      final resultantData = ImageGottenModel.fromJson(image);
      //print('MM$resume');

      return resultantData;
    } else {
      throw ServerException();
    }
  }
}
