import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smocabulary/core/presentation/themes.dart';
import 'package:smocabulary/features/courseadd/presentation/pages/course_add_page.dart';
import 'package:smocabulary/features/courselist/presentation/pages/courselist_page.dart';
import 'package:smocabulary/generated/locale_keys.g.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          onGenerateTitle: (BuildContext context) => LocaleKeys.app_title.tr(),
          debugShowCheckedModeBanner: false,
          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: AppTheme.fromType(ThemeType.defaultLight).themeData,
          darkTheme: AppTheme.fromType(ThemeType.defaultDark).themeData,
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SampleItemListView.routeName:
                  default:
                    return const CourseListPage();
                }
              },
            );
          },
          routes: {
            CourseListPage.courseListRoute: (ctxt) => const CourseListPage(),
            CourseAddPage.courseAddRoute: (ctxt) => const CourseAddPage(),
          },
        );
      },
    );
  }
}
