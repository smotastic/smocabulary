import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smocabulary/core/domain/failure.dart';
import 'package:smocabulary/features/courselist/domain/entity/course_list_entry.dart';
import 'package:smocabulary/features/courselist/domain/usecases/course_list_usecase.dart';

part 'courselist_state.dart';

@LazySingleton()
class CourseListCubit extends Cubit<CourseListState> {
  final CourseListUseCase _usecase;

  CourseListCubit(this._usecase) : super(CourseListLoadingState());

  void init() async {
    final result = await _usecase.execute(CourseListParams());
    final state = result.fold(
        (l) => CourseListLoadErrorState(l), (r) => CourseListLoadedState(r));
    emit(state);
  }
}
