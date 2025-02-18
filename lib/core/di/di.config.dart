// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/profile/data/remote_datasource/profile_api.dart' as _i917;
import '../../features/profile/data/repository/profile_repository_impl.dart'
    as _i309;
import '../../features/profile/domain/repository/profile_repository.dart'
    as _i364;
import '../../features/profile/presentation/view_model/change_password_cubit.dart'
    as _i389;
import '../../features/profile/presentation/view_model/edit_profile_cubit.dart'
    as _i589;
import '../../features/profile/presentation/view_model/profile_cubit.dart'
    as _i542;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i917.ProfileApi>(() => registerModule.profileApi);
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i364.ProfileRepository>(
      () => _i309.ProfileRepositoryImpl(gh<_i917.ProfileApi>()),
    );
    gh.factory<_i589.EditProfileCubit>(
      () => _i589.EditProfileCubit(gh<_i364.ProfileRepository>()),
    );
    gh.factory<_i542.ProfileCubit>(
      () => _i542.ProfileCubit(gh<_i364.ProfileRepository>()),
    );
    gh.factory<_i389.ChangePasswordCubit>(
      () => _i389.ChangePasswordCubit(gh<_i364.ProfileRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
