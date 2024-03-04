import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/constants/constants.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/features/contacts/data/models/contact_response.dart';

abstract class ContactDataSource {
  Future<ContactResponse> postContactData(Map<String, dynamic> contactData);
}

@Injectable(as: ContactDataSource)
class ContactDataSourceImpl implements ContactDataSource {
  final dio = Dio();
  @override
  Future<ContactResponse> postContactData(
      Map<String, dynamic> contactData) async {
    const contactUrl = '$baseServerUrl/contact-info';
    final Response response = await dio.post(contactUrl, data: contactData);
    if (response.statusCode == 200) {
      return ContactResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
