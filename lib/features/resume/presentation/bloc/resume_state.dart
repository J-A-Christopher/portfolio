part of 'resume_bloc.dart';

abstract class ResumeState extends Equatable {
  const ResumeState();

  @override
  List<Object> get props => [];
}

class ResumeInitial extends ResumeState {}

class ResumeLoading extends ResumeState {}

class ResumeLoaded extends ResumeState {
  const ResumeLoaded({required this.resData});
  final ResumeEntity resData;
}

class ResumeError extends ResumeState {
  const ResumeError({required this.errorMesage});
  final String errorMesage;
}
