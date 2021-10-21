import 'package:smartstruct/smartstruct.dart';
import 'package:smocabulary/features/courseadd/data/models/course_add_model.dart';
import 'package:smocabulary/features/courseadd/domain/entity/course_add_entity.dart';

part 'course_add_entity_mapper.mapper.g.dart';

@Mapper()
abstract class CourseAddEntityMapper {
  static CourseAddEntityMapper get instance => CourseAddEntityMapperImpl();

  CourseAddModel fromEntity(CourseAddEntity entity);
}
