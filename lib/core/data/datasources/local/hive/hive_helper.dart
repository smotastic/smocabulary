import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:smocabulary/service_locator.dart';

import '../db_helper.dart';

part 'hive_helper.g.dart';

@LazySingleton()
@hive
class HiveHelper extends DbHelper<HiveInterface> {
  HiveInterface? _db;

  @override
  Future<HiveInterface> get database async {
    return _db ?? await constructDb();
  }

  Future<HiveInterface> constructDb() async {
    await Hive.initFlutter();
    _db = Hive;
    _db!.registerAdapter(HiveCourseAdapter());
    return _db!;
  }
}

@HiveType(typeId: 1)
class HiveCourse {
  @HiveField(0)
  final num id;
  @HiveField(1)
  final String name;

  HiveCourse(this.id, this.name);
}
