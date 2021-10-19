import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smocabulary/service_locator.dart';

import 'core/data/config.dart';
import 'core/presentation/device_segment.dart';
import 'logger/logger.dart';
import 'logger/logger_level.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies({
    DeviceSegment.currentDevice.name,
  });
  await getIt.allReady();
  Config cfg = GetIt.I<Config>();
  Level envLevel = Logger.levelByName[cfg.get('log.level') ?? 'debug']!;
  Logger.I.level = envLevel;
  Logger.I.i('Hallo Welt!');

  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('de'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: MyApp(
          settingsController: settingsController,
        )),
  );
}
