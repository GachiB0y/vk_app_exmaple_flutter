import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vk_exmaple/domain/blocs/friend_list_bloc.dart';
import 'package:vk_exmaple/domain/data-provider/session_data_provider.dart';
import 'package:vk_exmaple/domain/repository/auth_repository.dart';
import 'package:vk_exmaple/domain/repository/friends_repository.dart';
import 'package:vk_exmaple/library/flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vk_exmaple/main.dart';
import 'package:vk_exmaple/ui/naviagtion/main_navigation.actions.dart';
import 'package:vk_exmaple/ui/naviagtion/main_navigation.dart';
import 'package:vk_exmaple/widget/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:vk_exmaple/widget/auth/auth_view_cubit.dart';
import 'package:vk_exmaple/widget/auth/auth_widget.dart';
import 'package:vk_exmaple/widget/friends_list/friends_list_widget.dart';
import 'package:vk_exmaple/widget/loader_widget/loader_view_cubit.dart';
import 'package:vk_exmaple/widget/loader_widget/loader_widget.dart';
import 'package:vk_exmaple/widget/main_screen/main_screen_widget.dart';
import 'package:vk_exmaple/widget/profil_details/profile_details_model.dart';
import 'package:vk_exmaple/widget/profil_details/profile_details_widget.dart';

AppFactory makeAppFactory () => const _AppFactoryDefault();

class _AppFactoryDefault implements AppFactory{
  final _diContainer = const _DIContainer();

  const _AppFactoryDefault();

  @override
  Widget makeApp() => MyApp(navigation:_diContainer._makeMyAppNavigation(),);
}

class _DIContainer{
  const _DIContainer();
  final SecureStorage _secureStorage = const SecureStorageDefault();
  final _mainNavigationAction = const MainNavigationAction();

  ScreenFactoryDefault _makeScreenFactory() => ScreenFactoryDefault(this);
  MyAppNavigation _makeMyAppNavigation() =>  MainNavigation(_makeScreenFactory());
  SessionDataProvdier _makeSessionDataProvdier()=> SessionDataProvdierDefault(_secureStorage);
  AuthRepository _makeAuthRepository()=> AuthRepository(_makeSessionDataProvdier());
  FriendsRepository _makeFriendsRepository()=> FriendsRepository(_makeSessionDataProvdier());
}

class ScreenFactoryDefault implements ScreenFactory{
  final _DIContainer _diContainer;
  const ScreenFactoryDefault(this._diContainer);

  @override
  Widget makeLoader() {
    return BlocProvider<LoaderViewCubit>(

      create: (context) => LoaderViewCubit(_diContainer._makeAuthRepository()),
      child: LoaderWidget(),
      lazy: false,
    );
  }

  @override
  Widget makeAuth() {
    return BlocProvider<AuthViewCubit>(
        create: (_) => AuthViewCubit(_diContainer._makeAuthRepository()),
        child:  AuthWidget(mainNavigationAction: _diContainer._mainNavigationAction,)
    );
  }

  @override
  Widget makeMainScreen() {
    return MainScreenWidget(
      screenFactory: _diContainer._makeScreenFactory(),
      mainNavigationAction: _diContainer._mainNavigationAction,
      sessionDataProvdier: _diContainer._makeSessionDataProvdier(),
    );
  }

  @override
  Widget makeProfileDetails(int friendId) {
    return ChangeNotifierProvider(
      create:(_) => UserDetailsModel(
          friendId: friendId,
        authRepository: _diContainer._makeAuthRepository(),
        friendRepository: _diContainer._makeFriendsRepository(),
        mainNavigationAction: _diContainer._mainNavigationAction
      ),
      child: const ProfilDetailsWidget(),
    );
  }

  @override
  Widget makeFriendList() {
    return BlocProvider<FriendsListViewBloc>(
      create: (_) => FriendsListViewBloc(_diContainer._makeFriendsRepository(),_diContainer._makeSessionDataProvdier()),
      child: FriendsListWidget(),
    );
  }
}