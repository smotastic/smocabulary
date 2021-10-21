import 'package:smocabulary/core/domain/domain.dart';
import 'package:smocabulary/features/courseadd/domain/entity/course_add_entity.dart';

abstract class CourseAddPort {
  FResult<void> save(CourseAddEntity entity);
}
