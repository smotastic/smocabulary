// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/data/config.dart' as _i3;
import 'core/data/datasources/local/hive/hive_helper.dart' as _i5;
import 'core/data/datasources/remote/supabase/supabase_helper.dart' as _i6;
import 'features/courselist/presentation/bloc/courselist_cubit.dart' as _i4;

const String _hive = 'hive';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singletonAsync<_i3.Config>(() => _i3.Config.create());
  gh.lazySingleton<_i4.CourseListCubit>(() => _i4.CourseListCubit());
  gh.lazySingleton<_i5.HiveHelper>(() => _i5.HiveHelper(),
      registerFor: {_hive});
  gh.lazySingletonAsync<_i6.SupabaseHelper>(
      () async => _i6.SupabaseHelper(await get.getAsync<_i3.Config>()));
  return get;
}
