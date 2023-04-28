// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:vk_exmaple/domain/blocs/friend_list_bloc.dart';
// import 'package:vk_exmaple/widget/auth/auth_view_cubit.dart';
// import 'package:vk_exmaple/widget/auth/auth_widget.dart';
// import 'package:vk_exmaple/widget/friends_list/friends_list_model.dart';
// import 'package:vk_exmaple/widget/friends_list/friends_list_widget.dart';
// import 'package:vk_exmaple/widget/loader_widget/loader_view_cubit.dart';
// import 'package:vk_exmaple/widget/loader_widget/loader_widget.dart';
// import 'package:vk_exmaple/widget/main_screen/main_screen_model.dart';
// import 'package:vk_exmaple/widget/main_screen/main_screen_widget.dart';
// import 'package:vk_exmaple/widget/profil_details/profile_details_model.dart';
// import 'package:vk_exmaple/widget/profil_details/profile_details_widget.dart';
//
// class ScreenFactory{
// const ScreenFactory();
//   Widget makeLoader() {
//       return BlocProvider<LoaderViewCubit>(
//
//         create: (context) => LoaderViewCubit(),
//         child: LoaderWidget(),
//         lazy: false,
//       );
//   }
//   Widget makeAuth() {
//     return BlocProvider<AuthViewCubit>(
//         create: (_) => AuthViewCubit(),
//         child: const AuthWidget()
//     );
//   }
//
//   Widget makeMainScreen() {
//     return MainScreenWidget();
//   }
//
//   Widget makeProfileDetails(int friendId) {
//     return ChangeNotifierProvider(
//       create:(_) => UserDetailsModel(friendId),
//       child: const ProfilDetailsWidget(),
//     );
//   }
//
//   Widget makeFriendList() {
//     return BlocProvider<FriendsListViewBloc>(
//         create: (_) => FriendsListViewBloc(),
//         child: FriendsListWidget(),
//     );
//   }
// }