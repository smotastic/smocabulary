import 'package:smartstruct/smartstruct.dart';
import 'package:smocabulary/features/courselist/data/models/course_list_model.dart';
import 'package:smocabulary/features/courselist/domain/entity/course_list_entry.dart';

part 'course_list_model_mapper.mapper.g.dart';

@Mapper()
abstract class CourseListModelMapper {
  static CourseListModelMapper get instance => CourseListModelMapperImpl();
  CourseListEntry fromModel(CourseListModel source);
}
