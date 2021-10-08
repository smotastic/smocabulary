import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smocabulary/core/domain/failure.dart';

part 'courselist_state.dart';

@LazySingleton()
class CourseListCubit extends Cubit<CourseListState> {
  CourseListCubit() : super(CourseListLoadingState());

  void init() {
    emit(CourseListLoadedState(const ['Course 1', 'Course2']));
  }
}
