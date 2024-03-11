part of 'projects_bloc.dart';

abstract class ProjectsState extends Equatable {
  const ProjectsState();

  @override
  List<Object> get props => [];
}

class ProjectsInitial extends ProjectsState {}

class ProjectsLoading extends ProjectsState {}

class ProjectsLoaded extends ProjectsState {
  const ProjectsLoaded({required this.projData});
  final List<ProjectEntity> projData;
}

class ProjectsError extends ProjectsState {
  const ProjectsError({required this.errorMessage});
  final String errorMessage;
}
