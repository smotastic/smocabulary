import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:smocabulary/core/data/datasources/local/hive/hive_helper.dart';
import 'package:smocabulary/core/domain/domain.dart';
import 'package:smocabulary/features/courselist/data/datasources/local/course_list_ds_local.dart';
import 'package:smocabulary/features/courselist/data/mapper/course_list_hive_mapper.dart';
import 'package:smocabulary/features/courselist/data/models/course_list_model.dart';

@LazySingleton(as: CourseListDatasourceLocal)
class CourseListDatasourceHive extends CourseListDatasourceLocal {
  final HiveHelper _helper;
  late final Future<HiveInterface> _db;
  CourseListDatasourceHive(this._helper) {
    _db = _helper.database;
  }
  @override
  FResult<List<CourseListModel>> find(Page page) async {
    final db = await _db;

    final courseBox = await db.openBox('course');
    final result = <CourseListModel>[];
    numberGenerator.skip(page.offset).take(page.pageSize).forEach((element) {
      HiveCourse? course = courseBox.get(element);
      if (course != null) {
        result.add(HiveCourseMapper.instance.fromHiveCourse(course));
      }
    });

    return Right(result);
  }

  Iterable<int> get numberGenerator sync* {
    int i = 0;
    while (true) {
      yield i++;
    }
  }
}
