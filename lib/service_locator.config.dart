// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/data/config.dart' as _i3;
import 'core/data/datasources/local/hive/hive_helper.dart' as _i5;
import 'core/data/datasources/remote/supabase/supabase_helper.dart' as _i6;
import 'features/courseadd/data/adapter/course_add_adapter.dart' as _i11;
import 'features/courseadd/data/datasources/local/course_add_ds_hive.dart'
    as _i9;
import 'features/courseadd/data/datasources/local/course_add_ds_local.dart'
    as _i8;
import 'features/courseadd/domain/ports/course_add_port.dart' as _i10;
import 'features/courseadd/domain/usecases/course_add_usecase.dart' as _i12;
import 'features/courselist/data/adapter/course_list_adapter.dart' as _i16;
import 'features/courselist/data/datasources/local/course_list_ds_hive.dart'
    as _i14;
import 'features/courselist/data/datasources/local/course_list_ds_local.dart'
    as _i13;
import 'features/courselist/domain/port/course_list_port.dart' as _i15;
import 'features/courselist/domain/usecases/course_list_usecase.dart' as _i17;
import 'features/courselist/presentation/bloc/courselist_cubit.dart' as _i18;
import 'features/courselist/presentation/bloc/viewtoggle_cubit.dart' as _i7;
import 'features/courselist/presentation/bridge/course_add_bridge.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singletonAsync<_i3.Config>(() => _i3.Config.create());
  gh.lazySingleton<_i4.CourseAddBridge>(() => _i4.CourseAddBridge());
  gh.lazySingleton<_i5.HiveHelper>(() => _i5.HiveHelper());
  gh.lazySingletonAsync<_i6.SupabaseHelper>(
      () async => _i6.SupabaseHelper(await get.getAsync<_i3.Config>()));
  gh.lazySingleton<_i7.ViewToggleCubit>(() => _i7.ViewToggleCubit());
  gh.lazySingleton<_i8.CourseAddDatasourceLocal>(
      () => _i9.CourseAddDatasourceHive(get<_i5.HiveHelper>()));
  gh.lazySingleton<_i10.CourseAddPort>(
      () => _i11.CourseAddAdapter(get<_i8.CourseAddDatasourceLocal>()));
  gh.lazySingleton<_i12.CourseAddUseCase>(
      () => _i12.CourseAddUseCaseImpl(get<_i10.CourseAddPort>()));
  gh.lazySingleton<_i13.CourseListDatasourceLocal>(
      () => _i14.CourseListDatasourceHive(get<_i5.HiveHelper>()));
  gh.lazySingleton<_i15.CourseListPort>(
      () => _i16.CourseListAdapter(get<_i13.CourseListDatasourceLocal>()));
  gh.lazySingleton<_i17.CourseListUseCase>(
      () => _i17.CourseListUseCaseImpl(get<_i15.CourseListPort>()));
  gh.lazySingleton<_i18.CourseListCubit>(
      () => _i18.CourseListCubit(get<_i17.CourseListUseCase>()));
  return get;
}
