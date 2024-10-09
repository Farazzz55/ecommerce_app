// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'package:ecommerce_app/data/api_manger.dart' as _i86;
import 'package:ecommerce_app/data/data_source/remote_data_source/add_to_cart_remote_data_source.dart'
    as _i249;
import 'package:ecommerce_app/data/data_source/remote_data_source/add_to_cart_remote_data_source_impl.dart'
    as _i129;
import 'package:ecommerce_app/data/data_source/remote_data_source/auth_remote_data_source.dart'
    as _i983;
import 'package:ecommerce_app/data/data_source/remote_data_source/auth_remote_data_source_impl.dart'
    as _i229;
import 'package:ecommerce_app/data/data_source/remote_data_source/get_cart_remote_data_source.dart'
    as _i166;
import 'package:ecommerce_app/data/data_source/remote_data_source/get_cart_remote_data_source_impl.dart'
    as _i100;
import 'package:ecommerce_app/data/data_source/remote_data_source/home_brands_remote_data_source.dart'
    as _i422;
import 'package:ecommerce_app/data/data_source/remote_data_source/home_brands_remote_data_source_impl.dart'
    as _i52;
import 'package:ecommerce_app/data/data_source/remote_data_source/home_category_remote_data_source.dart'
    as _i586;
import 'package:ecommerce_app/data/data_source/remote_data_source/home_category_remote_data_source_impl.dart'
    as _i957;
import 'package:ecommerce_app/data/data_source/remote_data_source/products_remote_data_source.dart'
    as _i481;
import 'package:ecommerce_app/data/data_source/remote_data_source/products_reomte_data_source_impl.dart'
    as _i809;
import 'package:ecommerce_app/data/repository/add_to_cart_repo_impl.dart' as _i136;
import 'package:ecommerce_app/data/repository/auth_repository_impl.dart' as _i448;
import 'package:ecommerce_app/data/repository/get_cart_repo_impl.dart' as _i890;
import 'package:ecommerce_app/data/repository/home_brands_repo_impl.dart' as _i825;
import 'package:ecommerce_app/data/repository/HomeCategory_repo_impl.dart' as _i853;
import 'package:ecommerce_app/data/repository/product_repo_impl.dart' as _i99;
import 'package:ecommerce_app/domain/repository/add_to_cart_repo.dart' as _i941;
import 'package:ecommerce_app/domain/repository/auth_repository.dart' as _i914;
import 'package:ecommerce_app/domain/repository/get_cart_repo.dart' as _i512;
import 'package:ecommerce_app/domain/repository/HomeBrands_repo.dart' as _i467;
import 'package:ecommerce_app/domain/repository/HomeCategory_repo.dart' as _i784;
import 'package:ecommerce_app/domain/repository/products_repo.dart' as _i444;
import 'package:ecommerce_app/domain/use_cases/add_to_cart_use_case.dart' as _i428;
import 'package:ecommerce_app/domain/use_cases/get_cart_use_case.dart' as _i214;
import 'package:ecommerce_app/domain/use_cases/home_brands_use_case.dart' as _i458;
import 'package:ecommerce_app/domain/use_cases/home_category_use_case.dart' as _i746;
import 'package:ecommerce_app/domain/use_cases/login_use_case.dart' as _i644;
import 'package:ecommerce_app/domain/use_cases/product_use_case.dart' as _i631;
import 'package:ecommerce_app/domain/use_cases/register_use_case.dart' as _i18;
import 'features/auth_presentations_screens/login_screen/cubit/login_view_model.dart'
    as _i592;
import 'features/auth_presentations_screens/register_screen/cubit/register_view_model.dart'
    as _i892;
import 'features/cart_screen/cubit/cart_screen_view_model.dart' as _i550;
import 'features/main_screen/home_screen/cubit/home_tab_view_model.dart'
    as _i278;
import 'features/products_screen/add_to_cart/cubit/add_to_cart_view_model.dart'
    as _i707;
import 'features/products_screen/cubit/products_screen_view_model.dart'
    as _i576;

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
    gh.factory<_i166.GetCartRemoteDataSource>(() =>
        _i100.GetCartRemoteDataSourceImpl(apiManger: gh<_i86.ApiManger>()));
    gh.factory<_i481.ProductRemoteDataSource>(() =>
        _i809.ProductsRemoteDataSourceImpl(apiManger: gh<_i86.ApiManger>()));
    gh.lazySingleton<_i422.HomeBrandsRemoteDataSource>(() =>
        _i52.HomeBrandsRemoteDataSourceImpl(apiManger: gh<_i86.ApiManger>()));
    gh.lazySingleton<_i586.HomeCategoryRemoteDataSource>(() =>
        _i957.HomeCategoryRemoteDataSourceImpl(
            apiManger: gh<_i86.ApiManger>()));
    gh.factory<_i249.AddToCartRemoteDataSource>(() =>
        _i129.AddToCartRemoteDataSourceImpl(apiManger: gh<_i86.ApiManger>()));
    gh.factory<_i983.AuthRemoteDataSource>(
        () => _i229.AuthRemoteDataSourceImpl(apiManger: gh<_i86.ApiManger>()));
    gh.factory<_i941.AddToCartRepo>(() => _i136.AddToCartRepoImpl(
        remoteDataSource: gh<_i249.AddToCartRemoteDataSource>()));
    gh.lazySingleton<_i467.HomeBrandsRepo>(() => _i825.HomeBrandsRepoImpl(
        brandsRemoteDataSource: gh<_i422.HomeBrandsRemoteDataSource>()));
    gh.factory<_i428.AddToCartUseCase>(
        () => _i428.AddToCartUseCase(addToCartRepo: gh<_i941.AddToCartRepo>()));
    gh.factory<_i444.ProductsRepo>(() => _i99.ProductRepoImpl(
        productRemoteDataSource: gh<_i481.ProductRemoteDataSource>()));
    gh.factory<_i512.GetCartRepo>(() => _i890.GetCartRepoImpl(
        remoteDataSource: gh<_i166.GetCartRemoteDataSource>()));
    gh.factory<_i214.GetCartUseCase>(
        () => _i214.GetCartUseCase(getCartRepo: gh<_i512.GetCartRepo>()));
    gh.factory<_i914.AuthRepository>(() => _i448.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i983.AuthRemoteDataSource>()));
    gh.factory<_i644.LoginUseCase>(
        () => _i644.LoginUseCase(authRepository: gh<_i914.AuthRepository>()));
    gh.factory<_i18.RegisterUseCase>(
        () => _i18.RegisterUseCase(authRepository: gh<_i914.AuthRepository>()));
    gh.factory<_i592.LoginViewModel>(
        () => _i592.LoginViewModel(loginUseCase: gh<_i644.LoginUseCase>()));
    gh.lazySingleton<_i784.HomeCategoryRepo>(() => _i853.HomeCategoryRepoImpl(
        categoryRemoteDataSource: gh<_i586.HomeCategoryRemoteDataSource>()));
    gh.factory<_i707.AddToCartViewModel>(() =>
        _i707.AddToCartViewModel(cartUseCase: gh<_i428.AddToCartUseCase>()));
    gh.factory<_i550.CartScreenViewModel>(
        () => _i550.CartScreenViewModel(useCase: gh<_i214.GetCartUseCase>()));
    gh.factory<_i631.ProductUseCase>(
        () => _i631.ProductUseCase(productsRepo: gh<_i444.ProductsRepo>()));
    gh.factory<_i458.HomeBrandsUseCase>(
        () => _i458.HomeBrandsUseCase(brandsRepo: gh<_i467.HomeBrandsRepo>()));
    gh.factory<_i746.HomeCategoryUseCase>(() => _i746.HomeCategoryUseCase(
        homeCategoryRepo: gh<_i784.HomeCategoryRepo>()));
    gh.factory<_i892.RegisterViewModel>(() =>
        _i892.RegisterViewModel(registerUseCase: gh<_i18.RegisterUseCase>()));
    gh.factory<_i576.ProductsScreenViewModel>(() =>
        _i576.ProductsScreenViewModel(
            productUseCase: gh<_i631.ProductUseCase>()));
    gh.factory<_i278.HomeTabViewModel>(() => _i278.HomeTabViewModel(
          categoryUseCase: gh<_i746.HomeCategoryUseCase>(),
          brandsUseCase: gh<_i458.HomeBrandsUseCase>(),
        ));
    return this;
  }
}
