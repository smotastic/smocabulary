import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:smocabulary/core/presentation/bridge.dart';
import 'package:smocabulary/features/courseadd/presentation/pages/course_add_page.dart';

@LazySingleton()
class CourseAddBridge extends Bridge<void, BuildContext> {
  @override
  void bridge(BuildContext value) {
    Navigator.of(value).pushNamed(CourseAddPage.courseAddRoute);
  }
}
