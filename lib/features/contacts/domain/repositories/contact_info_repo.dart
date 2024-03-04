import 'package:dartz/dartz.dart';
import 'package:portfolio/common/failures/failures.dart';
import 'package:portfolio/features/contacts/domain/entities/contact_info_entity.dart';

abstract class ContactInfoDomainRepository {
   Future<Either<Failure, ContactInfoEntity>>  contactInfoDomainRepository(Map<String,dynamic>contactData);
}
