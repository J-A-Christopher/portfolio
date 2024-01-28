part of 'bio_card_bloc.dart';

abstract class BioCardState extends Equatable {
  const BioCardState();

  @override
  List<Object> get props => [];
}

class BioCardInitial extends BioCardState {}

class BioCardLoading extends BioCardState {}

class BioCardLoaded extends BioCardState {
  final List<AboutMeEntity> aboutData;
  const BioCardLoaded({required this.aboutData});
  @override
  List<Object> get props => [aboutData];
}

class BioCardError extends BioCardState {}
