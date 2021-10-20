import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smocabulary/core/domain/domain.dart';
import 'package:smocabulary/core/domain/result.dart';
import 'package:smocabulary/features/courselist/data/datasources/local/course_list_ds_local.dart';
import 'package:smocabulary/features/courselist/domain/entity/course_list_entry.dart';
import 'package:smocabulary/features/courselist/domain/port/course_list_port.dart';
import 'package:smocabulary/features/courselist/data/mapper/course_list_model_mapper.dart';

@LazySingleton(as: CourseListPort)
class CourseListAdapter extends CourseListPort {
  final CourseListDatasourceLocal _localDs;

  CourseListAdapter(this._localDs);

  @override
  Future<Result<List<CourseListEntry>>> find() async {
    final localResult = await _localDs.find(Page());
    final courses = localResult.getOrElse(() => throw UnknownFailure());
    return Right(
        courses.map(CourseListModelMapper.instance.fromModel).toList());
  }
}
