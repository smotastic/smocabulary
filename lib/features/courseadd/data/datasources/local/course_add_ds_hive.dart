import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:smocabulary/core/data/datasources/local/hive/hive_helper.dart';
import 'package:smocabulary/core/domain/result.dart';
import 'package:smocabulary/features/courseadd/data/datasources/local/course_add_ds_local.dart';
import 'package:smocabulary/features/courseadd/data/models/course_add_model.dart';
import 'package:smocabulary/features/courseadd/data/mapper/course_add_model_mapper.dart';

@LazySingleton(as: CourseAddDatasourceLocal)
class CourseAddDatasourceHive extends CourseAddDatasourceLocal {
  final HiveHelper _helper;
  late final Future<HiveInterface> _db;

  CourseAddDatasourceHive(this._helper) {
    _db = _helper.database;
  }

  @override
  FResult<void> save(CourseAddModel model) async {
    final db = await _db;
    final hiveModel = CourseAddModelMapper.instance.fromModel(model);
    final box = await db.openBox(HiveMeta.courseBox);
    box.put(hiveModel.name, hiveModel);

    return const Right(null);
  }
}
