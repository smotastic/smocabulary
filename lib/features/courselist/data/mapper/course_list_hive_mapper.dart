import 'package:smartstruct/smartstruct.dart';
import 'package:smocabulary/core/data/datasources/local/hive/hive_helper.dart';
import 'package:smocabulary/features/courselist/data/models/course_list_model.dart';

part 'course_list_hive_mapper.mapper.g.dart';

@Mapper()
abstract class HiveCourseMapper {
  static HiveCourseMapper get instance => HiveCourseMapperImpl();
  CourseListModel fromHiveCourse(HiveCourse source);
}
