// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/data/config.dart' as _i3;
import 'core/data/datasources/local/hive/hive_helper.dart' as _i4;
import 'core/data/datasources/remote/supabase/supabase_helper.dart' as _i5;

const String _hive = 'hive';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singletonAsync<_i3.Config>(() => _i3.Config.create());
  gh.lazySingleton<_i4.HiveHelper>(() => _i4.HiveHelper(),
      registerFor: {_hive});
  gh.lazySingletonAsync<_i5.SupabaseHelper>(
      () async => _i5.SupabaseHelper(await get.getAsync<_i3.Config>()));
  return get;
}
