import 'package:flutter/material.dart';
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
  Level envLevel = Logger.levelByName[Config.I.get('log.level') ?? 'debug']!;
  Logger.I.level = envLevel;
  Logger.I.i('Hallo Welt!');

  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();
  runApp(MyApp(
    settingsController: settingsController,
  ));
}
