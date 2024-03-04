import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/di/di.dart';
import 'package:portfolio/features/contacts/domain/entities/contact_info_entity.dart';
import 'package:portfolio/features/contacts/domain/repositories/contact_info_repo.dart';

@injectable
class ContactUseCase {
  Future<Either<Failure, ContactInfoEntity>> contactUseCases(
      Map<String, dynamic> userData) async {
    final dataRepo = getIt<ContactInfoDomainRepository>();
    final result = dataRepo.contactInfoDomainRepository(userData);
    return result;
  }
}
