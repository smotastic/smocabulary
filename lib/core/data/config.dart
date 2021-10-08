import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class Config {
  @factoryMethod
  static Future<Config> create() async {
    await dotenv.load(fileName: ".env");
    Map<String, String> config = {};
    if (!kIsWeb) {
      config.addAll({...Platform.environment});
    }
    config.addAll(dotenv.env);
    return Config._(config);
  }

  final Map<String, String> _config;

  Config._(this._config);

  String? get(String key) {
    return _config[key];
  }
}
