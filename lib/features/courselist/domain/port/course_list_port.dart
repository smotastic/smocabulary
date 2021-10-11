import 'package:smocabulary/core/domain/result.dart';
import 'package:smocabulary/features/courselist/domain/entity/course_list_entry.dart';

abstract class CourseListPort {
  Future<Result<List<CourseListEntry>>> find();
}
