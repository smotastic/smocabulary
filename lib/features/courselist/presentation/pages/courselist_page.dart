import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smocabulary/core/presentation/styles.dart';
import 'package:smocabulary/features/courseadd/presentation/pages/course_add_page.dart';
import 'package:smocabulary/features/courselist/presentation/bloc/courselist_cubit.dart';
import 'package:smocabulary/features/courselist/presentation/bloc/viewtoggle_cubit.dart';
import 'package:smocabulary/features/courselist/presentation/bloc/viewtoggle_state.dart';
import 'package:smocabulary/features/courselist/presentation/bridge/course_add_bridge.dart';
import 'package:smocabulary/features/courselist/presentation/widgets/course_list_item.dart';
import 'package:smocabulary/generated/locale_keys.g.dart';

class CourseListPage extends StatelessWidget {
  static String courseListRoute = '/course';

  const CourseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<CourseListCubit>()..init()),
        BlocProvider(create: (_) => GetIt.I<ViewToggleCubit>()),
      ],
      child: const CourseListView(),
    );
  }
}

class CourseListView extends StatelessWidget {
  const CourseListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewToggleCubit, ViewState>(
      builder: (viewcontext, viewstate) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(Insets.small),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<ViewToggleCubit>(viewcontext).toggle();
                  },
                  child: Icon(viewstate is ListViewState
                      ? Icons.grid_view
                      : Icons.view_list),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Insets.small),
                child: GestureDetector(
                  onTap: () {
                    GetIt.I<CourseAddBridge>().bridge(context);
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ],
            title: const Text(LocaleKeys.feature_courselist_page_title).tr(),
          ),
          body: BlocBuilder<CourseListCubit, CourseListState>(
              builder: (coursecontext, coursestate) {
            if (coursestate is CourseListLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (coursestate is CourseListLoadedState) {
              if (viewstate is ListViewState) {
                return ListView.builder(
                  itemBuilder: _itemBuilder(coursestate),
                  itemCount: coursestate.courses.length + 1,
                );
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 18 / 2,
                  crossAxisCount:
                      (MediaQuery.of(coursecontext).size.width ~/ 450),
                  mainAxisSpacing: 2,
                ),
                itemBuilder: _itemBuilder(coursestate),
                itemCount: coursestate.courses.length + 1,
              );
            }
            return Container();
          }),
        );
      },
    );
  }

  Widget Function(BuildContext, int) _itemBuilder(
      CourseListLoadedState coursestate) {
    return (BuildContext ctxt, int i) {
      if (i >= coursestate.courses.length) {
        // BlocProvider.of<CourseListCubit>(context).requestNextPage();
        return const Center(child: CircularProgressIndicator());
      }
      final course = coursestate.courses[i];
      return CourseListItem(course);
    };
  }
}
