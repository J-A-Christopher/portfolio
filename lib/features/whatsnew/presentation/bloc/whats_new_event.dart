part of 'whats_new_bloc.dart';

abstract class WhatsNewEvent extends Equatable {
  const WhatsNewEvent();

  @override
  List<Object> get props => [];
}

class GetWhatsNew extends WhatsNewEvent {}  
