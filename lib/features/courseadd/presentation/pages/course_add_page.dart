import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smocabulary/generated/locale_keys.g.dart';

class CourseAddPage extends StatelessWidget {
  static String courseAddRoute = '/add-course';
  const CourseAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.feature_courseadd_page_title.tr()),
      ),
      body: Container(
        child: const Text('Hallo'),
      ),
    );
  }
}
