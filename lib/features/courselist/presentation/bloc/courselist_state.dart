part of 'courselist_cubit.dart';

abstract class CourseListState extends Equatable {}

class CourseListLoadingState extends CourseListState {
  @override
  List<Object?> get props => [];
}

class CourseListLoadedState extends CourseListState {
  final List<CourseListEntry> courses;

  CourseListLoadedState(this.courses);

  @override
  List<Object?> get props => [courses];
}

class CourseListLoadErrorState extends CourseListState {
  final Failure failure;

  CourseListLoadErrorState(this.failure);

  @override
  List<Object?> get props => [failure];
}
