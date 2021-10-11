import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smocabulary/features/courselist/presentation/bloc/courselist_cubit.dart';
import 'package:smocabulary/features/courselist/presentation/widgets/course_list_item.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<CourseListCubit>()..init(),
      child: CourseListView(),
    );
  }
}

class CourseListView extends StatelessWidget {
  const CourseListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bibliothek'),
      ),
      body: BlocBuilder<CourseListCubit, CourseListState>(
          builder: (context, state) {
        if (state is CourseListLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CourseListLoadedState) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 10 / 2,
              crossAxisCount: (MediaQuery.of(context).size.width ~/ 250),
              mainAxisSpacing: 2,
            ),
            itemBuilder: (_, i) {
              if (i >= state.courses.length) {
                // BlocProvider.of<CourseListCubit>(context).requestNextPage();
                return const Center(child: CircularProgressIndicator());
              }
              final course = state.courses[i];
              return CourseListItem(course);
            },
            itemCount: state.courses.length + 1,
          );
        }
        return Container();
      }),
    );
  }
}
