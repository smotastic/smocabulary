// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/data/datasources/local/hive/hive_helper.dart' as _i3;
import 'core/data/datasources/remote/supabase/supabase_helper.dart' as _i4;

const String _hive = 'hive';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.HiveHelper>(() => _i3.HiveHelper(),
      registerFor: {_hive});
  gh.lazySingleton<_i4.SupabaseHelper>(() => _i4.SupabaseHelper());
  return get;
}
