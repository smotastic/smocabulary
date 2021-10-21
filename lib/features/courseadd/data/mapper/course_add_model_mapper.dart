import 'package:smartstruct/smartstruct.dart';
import 'package:smocabulary/core/data/datasources/local/hive/hive_helper.dart';
import 'package:smocabulary/features/courseadd/data/models/course_add_model.dart';

part 'course_add_model_mapper.mapper.g.dart';

@Mapper()
abstract class CourseAddModelMapper {
  static CourseAddModelMapper get instance => CourseAddModelMapperImpl();
  HiveCourse fromModel(CourseAddModel model);
}
