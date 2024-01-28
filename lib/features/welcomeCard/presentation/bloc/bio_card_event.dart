part of 'bio_card_bloc.dart';

abstract class BioCardEvent extends Equatable {
  const BioCardEvent();

  @override
  List<Object> get props => [];
}

class RetrieveBioCardData extends BioCardEvent{
  
}