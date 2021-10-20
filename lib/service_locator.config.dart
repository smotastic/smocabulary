// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/data/config.dart' as _i3;
import 'core/data/datasources/local/hive/hive_helper.dart' as _i7;
import 'core/data/datasources/remote/supabase/supabase_helper.dart' as _i8;
import 'features/courselist/data/adapter/course_list_adapter.dart' as _i5;
import 'features/courselist/domain/port/course_list_port.dart' as _i4;
import 'features/courselist/domain/usecases/course_list_usecase.dart' as _i6;
import 'features/courselist/presentation/bloc/courselist_cubit.dart' as _i10;
import 'features/courselist/presentation/bloc/viewtoggle_cubit.dart' as _i9;

const String _hive = 'hive';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singletonAsync<_i3.Config>(() => _i3.Config.create());
  gh.lazySingleton<_i4.CourseListPort>(() => _i5.CourseListAdapter());
  gh.lazySingleton<_i6.CourseListUseCase>(
      () => _i6.CourseListUseCaseImpl(get<_i4.CourseListPort>()));
  gh.lazySingleton<_i7.HiveHelper>(() => _i7.HiveHelper(),
      registerFor: {_hive});
  gh.lazySingletonAsync<_i8.SupabaseHelper>(
      () async => _i8.SupabaseHelper(await get.getAsync<_i3.Config>()));
  gh.lazySingleton<_i9.ViewToggleCubit>(() => _i9.ViewToggleCubit());
  gh.lazySingleton<_i10.CourseListCubit>(
      () => _i10.CourseListCubit(get<_i6.CourseListUseCase>()));
  return get;
}
