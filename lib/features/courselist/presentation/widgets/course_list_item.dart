import 'package:flutter/material.dart';
import 'package:smocabulary/core/presentation/styles.dart';
import 'package:smocabulary/features/courselist/domain/entity/course_list_entry.dart';

class CourseListItem extends StatelessWidget {
  final CourseListEntry course;

  const CourseListItem(this.course, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // ...
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(Insets.xsmall),
        child: Padding(
          padding: const EdgeInsets.all(Insets.small),
          child: Row(
            children: [
              Text(course.name),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              )
            ],
          ),
        ),
      ),
    );
  }
}
