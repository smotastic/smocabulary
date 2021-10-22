import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:smocabulary/core/presentation/bridge.dart';
import 'package:smocabulary/features/courseadd/presentation/pages/course_add_page.dart';

@LazySingleton()
class CourseListToAddBridge extends ContextBridge<void> {
  @override
  void bridge(BuildContext value) {
    Navigator.of(value).pushNamed(CourseAddPage.courseAddRoute);
  }
}
