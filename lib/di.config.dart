// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/api_manger.dart' as _i86;
import 'data/data_source/remote_data_source/auth_remote_data_source.dart'
    as _i983;
import 'data/data_source/remote_data_source/auth_remote_data_source_impl.dart'
    as _i229;
import 'data/repository/auth_repository_impl.dart' as _i448;
import 'domain/repository/auth_repository.dart' as _i914;
import 'domain/use_cases/register_use_case.dart' as _i18;
import 'features/auth_presentations_screens/register_screen/cubit/register_view_model.dart'
    as _i892;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i86.ApiManger>(() => _i86.ApiManger());
    gh.factory<_i983.AuthRemoteDataSource>(
        () => _i229.AuthRemoteDataSourceImpl(apiManger: gh<_i86.ApiManger>()));
    gh.factory<_i914.AuthRepository>(() => _i448.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i983.AuthRemoteDataSource>()));
    gh.factory<_i18.RegisterUseCase>(
        () => _i18.RegisterUseCase(authRepository: gh<_i914.AuthRepository>()));
    gh.factory<_i892.RegisterViewModel>(() =>
        _i892.RegisterViewModel(registerUseCase: gh<_i18.RegisterUseCase>()));
    return this;
  }
}
