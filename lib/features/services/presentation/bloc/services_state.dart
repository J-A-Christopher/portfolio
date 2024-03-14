part of 'services_bloc.dart';

abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object> get props => [];
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  const ServicesLoaded({required this.servicesData});
  final List<ServicesEntity> servicesData;
}

class ServiceError extends ServicesState {
  const ServiceError({required this.errorMessage});
  final String errorMessage;
}
