// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_list_hive_mapper.dart';

// **************************************************************************
// MapperGenerator
// **************************************************************************

class HiveCourseMapperImpl extends HiveCourseMapper {
  HiveCourseMapperImpl() : super();

  @override
  CourseListModel fromHiveCourse(HiveCourse source) {
    final courselistmodel = CourseListModel(source.id, source.name);
    return courselistmodel;
  }
}
