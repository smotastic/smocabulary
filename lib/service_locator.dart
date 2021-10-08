import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'core/presentation/device_segment.dart';
import 'logger/logger.dart';
import 'service_locator.config.dart';

final getIt = GetIt.instance;

const mobile = Environment(DeviceSegment.mobile);
const web = Environment(DeviceSegment.web);

const hive = Environment('hive');

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies(Set<String> environments) async {
  Logger.I.i('Environments for DI: $environments');
  $initGetIt(getIt, environmentFilter: NoEnvOrContainsAny(environments));
}
