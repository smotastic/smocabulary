import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smocabulary/core/domain/failure.dart';
import 'package:smocabulary/features/courselist/domain/entity/course_list_entry.dart';

part 'courselist_state.dart';

@LazySingleton()
class CourseListCubit extends Cubit<CourseListState> {
  CourseListCubit() : super(CourseListLoadingState());

  void init() {
    emit(CourseListLoadedState([
      CourseListEntry('Kurs 1'),
      CourseListEntry('Kurs 2'),
      CourseListEntry('Kurs 1'),
      CourseListEntry('Kurs 2'),
      CourseListEntry('Kurs 1'),
      CourseListEntry('Kurs 2'),
    ]));
  }
}
