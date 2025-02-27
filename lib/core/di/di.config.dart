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

import '../../features/explore_subjects/data/explore_repo_impl/explore_repo_impl.dart'
    as _i444;
import '../../features/explore_subjects/data/get_subject_remote_data_source_repo/get_subject_remote_data_source_repo.dart'
    as _i794;
import '../../features/explore_subjects/data/get_subject_remote_data_source_repo_impl/get_subject_remote_data_source_repo_impl.dart'
    as _i151;
import '../../features/explore_subjects/data/models/subject_model.dart'
    as _i868;
import '../../features/explore_subjects/domain/explore_repo/explore_repo.dart'
    as _i729;
import '../../features/explore_subjects/domain/use_cases/get_subjects_usecase.dart'
    as _i156;
import '../../features/explore_subjects/presentation/cubits/explore_cubit.dart'
    as _i362;
import '../api_manager/api_di.dart' as _i285;
import '../api_manager/api_manager.dart' as _i266;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioInjection = _$DioInjection();
    gh.singleton<_i361.Dio>(() => dioInjection.injectDio());
    gh.factory<_i362.ExploreState>(
      () => _i362.ExploreState(
        subjects: gh<List<_i868.SubjectModel>>(),
        status: gh<_i362.States>(),
        exception: gh<Exception>(),
      ),
    );
    gh.singleton<_i266.RestClient>(
      () => dioInjection.injectRestClient(gh<_i361.Dio>()),
    );
    gh.factory<_i794.GetSubjectsDataSourceRepo>(
      () => _i151.GetSubjectsDataSourceImpl(gh<_i266.RestClient>()),
    );
    gh.factory<_i729.ExploreRepo>(
      () => _i444.ExploreRepoImpl(gh<_i794.GetSubjectsDataSourceRepo>()),
    );
    gh.factory<_i156.GetSubjectsUseCase>(
      () => _i156.GetSubjectsUseCase(gh<_i729.ExploreRepo>()),
    );
    gh.factory<_i362.ExploreCubit>(
      () => _i362.ExploreCubit(gh<_i156.GetSubjectsUseCase>()),
    );
    return this;
  }
}

class _$DioInjection extends _i285.DioInjection {}
