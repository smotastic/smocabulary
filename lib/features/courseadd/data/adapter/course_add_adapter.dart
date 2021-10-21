import 'package:injectable/injectable.dart';
import 'package:smocabulary/features/courseadd/data/datasources/local/course_add_ds_local.dart';
import 'package:smocabulary/features/courseadd/domain/entity/course_add_entity.dart';
import 'package:smocabulary/core/domain/domain.dart';
import 'package:smocabulary/features/courseadd/domain/ports/course_add_port.dart';
import 'package:smocabulary/features/courseadd/data/mapper/course_add_entity_mapper.dart';

@LazySingleton(as: CourseAddPort)
class CourseAddAdapter extends CourseAddPort {
  final CourseAddDatasourceLocal _localDs;

  CourseAddAdapter(this._localDs);

  @override
  FResult<void> save(CourseAddEntity entity) async {
    return _localDs.save(CourseAddEntityMapper.instance.fromEntity(entity));
  }
}
