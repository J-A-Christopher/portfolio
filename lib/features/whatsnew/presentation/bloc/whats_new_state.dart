part of 'whats_new_bloc.dart';

abstract class WhatsNewState extends Equatable {
  const WhatsNewState();

  @override
  List<Object> get props => [];
}

class WhatsNewInitial extends WhatsNewState {}

class WhatsNewLoading extends WhatsNewState {}

class WhatsNewLoaded extends WhatsNewState {
  final List<WhatsNewEntity> whatsNewEntity;
  WhatsNewLoaded({required this.whatsNewEntity});
}

class WhatsNewError extends WhatsNewState {
  final String errorMessage;
  const WhatsNewError({required this.errorMessage});
}
