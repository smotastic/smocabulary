import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smocabulary/core/domain/domain.dart';
import 'package:smocabulary/features/courseadd/domain/entity/course_add_entity.dart';
import 'package:smocabulary/features/courseadd/domain/ports/course_add_port.dart';

abstract class CourseAddUseCase extends UseCase<void, CourseAddParams> {}

@LazySingleton(as: CourseAddUseCase)
class CourseAddUseCaseImpl extends CourseAddUseCase {
  final CourseAddPort _port;

  CourseAddUseCaseImpl(this._port);
  @override
  FResult<void> execute(CourseAddParams params) async {
    return _port.save(params.entity);
  }
}

class CourseAddParams extends Params {
  final CourseAddEntity entity;

  CourseAddParams(this.entity);

  @override
  List<Object?> get props => [entity];
}
