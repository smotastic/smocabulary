import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smocabulary/core/domain/result.dart';
import 'package:smocabulary/features/courselist/domain/entity/course_list_entry.dart';
import 'package:smocabulary/features/courselist/domain/port/course_list_port.dart';

@LazySingleton(as: CourseListPort)
class CourseListAdapter extends CourseListPort {
  @override
  Future<Result<List<CourseListEntry>>> find() async {
    return Right([
      CourseListEntry('Kurs 1'),
      CourseListEntry('Kurs 2'),
      CourseListEntry('Kurs 3'),
      CourseListEntry('Kurs 4'),
      CourseListEntry('Kurs 5'),
      CourseListEntry('Kurs 6')
    ]);
  }
}
