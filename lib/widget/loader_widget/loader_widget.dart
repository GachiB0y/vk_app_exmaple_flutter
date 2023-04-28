import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_exmaple/ui/naviagtion/main_navigation_route_names.dart';
import 'package:vk_exmaple/widget/loader_widget/loader_view_cubit.dart';



class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoaderViewCubit,LoaderViewCubitState>(
      listenWhen: (prev, current) => current!= LoaderViewCubitState.unknown,
      listener: (context,state){
        _onLoaderViewCubitStateChange(context,state);
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  void _onLoaderViewCubitStateChange(BuildContext context,LoaderViewCubitState state ){
    final nextScreen = state == LoaderViewCubitState.authorized
        ? MainNavigationRouteNames.mainScreen
        :MainNavigationRouteNames.auth;
    Navigator.of(context).popAndPushNamed(nextScreen);
  }

}
