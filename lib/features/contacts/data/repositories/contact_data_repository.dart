import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/exceptions/exception.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/contacts/data/datasources/contact_datasource.dart';
import 'package:portfolio/features/contacts/domain/entities/contact_info_entity.dart';
import 'package:portfolio/features/contacts/domain/repositories/contact_info_repo.dart';

@Injectable(as: ContactInfoDomainRepository)
class ContactDataRepository implements ContactInfoDomainRepository {
  @override
  Future<Either<Failure, ContactInfoEntity>> contactInfoDomainRepository(
      Map<String, dynamic> contactData) async {
    try {
      final dataSource = getIt<ContactDataSource>();
      final endResult = await dataSource.postContactData(contactData);
      return right(endResult);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
