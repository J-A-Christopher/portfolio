part of 'contact_info_bloc.dart';

abstract class ContactInfoEvent extends Equatable {
  const ContactInfoEvent();

  @override
  List<Object> get props => [];
}

class PostContactInfo extends ContactInfoEvent {
  const PostContactInfo({required this.contactInfo});
  final Map<String, dynamic> contactInfo;
  @override
  List<Object> get props => [];
}
