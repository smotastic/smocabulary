// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/data/config.dart' as _i3;
import 'core/data/datasources/local/hive/hive_helper.dart' as _i4;
import 'core/data/datasources/remote/supabase/supabase_helper.dart' as _i5;
import 'features/courselist/data/adapter/course_list_adapter.dart' as _i10;
import 'features/courselist/data/datasources/local/course_list_ds_hive.dart'
    as _i8;
import 'features/courselist/data/datasources/local/course_list_ds_local.dart'
    as _i7;
import 'features/courselist/domain/port/course_list_port.dart' as _i9;
import 'features/courselist/domain/usecases/course_list_usecase.dart' as _i11;
import 'features/courselist/presentation/bloc/courselist_cubit.dart' as _i12;
import 'features/courselist/presentation/bloc/viewtoggle_cubit.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singletonAsync<_i3.Config>(() => _i3.Config.create());
  gh.lazySingleton<_i4.HiveHelper>(() => _i4.HiveHelper());
  gh.lazySingletonAsync<_i5.SupabaseHelper>(
      () async => _i5.SupabaseHelper(await get.getAsync<_i3.Config>()));
  gh.lazySingleton<_i6.ViewToggleCubit>(() => _i6.ViewToggleCubit());
  gh.lazySingleton<_i7.CourseListDatasourceLocal>(
      () => _i8.CourseListDatasourceHive(get<_i4.HiveHelper>()));
  gh.lazySingleton<_i9.CourseListPort>(
      () => _i10.CourseListAdapter(get<_i7.CourseListDatasourceLocal>()));
  gh.lazySingleton<_i11.CourseListUseCase>(
      () => _i11.CourseListUseCaseImpl(get<_i9.CourseListPort>()));
  gh.lazySingleton<_i12.CourseListCubit>(
      () => _i12.CourseListCubit(get<_i11.CourseListUseCase>()));
  return get;
}
