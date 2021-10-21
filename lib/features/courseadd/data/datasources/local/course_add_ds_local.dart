import 'package:smocabulary/core/domain/domain.dart';
import 'package:smocabulary/features/courseadd/data/models/course_add_model.dart';

abstract class CourseAddDatasourceLocal {
  FResult<void> save(CourseAddModel model);
}
