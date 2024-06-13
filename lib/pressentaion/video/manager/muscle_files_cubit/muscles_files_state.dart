part of 'muscles_files_cubit.dart';

@immutable
abstract class MusclesFilesState {}

class MusclesFilesInitial extends MusclesFilesState {}
class MusclesFilesLoading extends MusclesFilesState {}
class MusclesFilesFailure extends MusclesFilesState {
  final String errorMessage;

  MusclesFilesFailure(this.errorMessage);
}
class MusclesFilesSuccess extends MusclesFilesState {
  final List<MusclePartFile> files;

  MusclesFilesSuccess(this.files);
}
