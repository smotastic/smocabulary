import 'package:smocabulary/core/domain/domain.dart';
import 'package:smocabulary/features/courselist/data/models/course_list_model.dart';
import 'package:smocabulary/features/courselist/domain/entity/course_list_entry.dart';
import 'package:smocabulary/core/domain/result.dart';

abstract class CourseListDatasourceLocal {
  FResult<List<CourseListModel>> find(Page page);
}
