part of 'contact_info_bloc.dart';

abstract class ContactInfoState extends Equatable {
  const ContactInfoState();

  @override
  List<Object> get props => [];
}

class ContactInfoInitial extends ContactInfoState {}

class ContactInfoLoading extends ContactInfoState {}

class ContactInfoLoaded extends ContactInfoState {
 const ContactInfoLoaded({required this.contactResponse});
  final ContactInfoEntity contactResponse;
}

class ContactInfoError extends ContactInfoState {
  const ContactInfoError({required this.errorMessage});
  final String errorMessage;
}
