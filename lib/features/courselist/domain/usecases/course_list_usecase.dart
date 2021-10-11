import 'package:injectable/injectable.dart';
import 'package:smocabulary/core/domain/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:smocabulary/core/domain/usecase.dart';
import 'package:smocabulary/features/courselist/domain/entity/course_list_entry.dart';
import 'package:smocabulary/features/courselist/domain/port/course_list_port.dart';

abstract class CourseListUseCase
    extends UseCase<List<CourseListEntry>, CourseListParams> {}

@LazySingleton(as: CourseListUseCase)
class CourseListUseCaseImpl extends CourseListUseCase {
  final CourseListPort _port;

  CourseListUseCaseImpl(this._port);

  @override
  Future<Either<Failure, List<CourseListEntry>>> execute(
      CourseListParams params) {
    return _port.find();
  }
}

class CourseListParams extends Params {
  @override
  List<Object?> get props => [];
}
