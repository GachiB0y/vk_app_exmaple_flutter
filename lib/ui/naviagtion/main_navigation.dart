
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_exmaple/ui/naviagtion/main_navigation_route_names.dart';
import 'package:vk_exmaple/widget/app/my_app.dart';


abstract class ScreenFactory{
  Widget makeLoader() ;
  Widget makeAuth() ;
  Widget makeMainScreen();
  Widget makeProfileDetails(int friendId);
  Widget makeFriendList();
}

class MainNavigation implements MyAppNavigation{
  final ScreenFactory screenFactory;

  const MainNavigation(this.screenFactory);

  @override
  Map <String, Widget Function(BuildContext)> get routes => <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.loaderWidget:(_) => screenFactory.makeLoader(),
    MainNavigationRouteNames.auth: (_) =>screenFactory.makeAuth(),
    MainNavigationRouteNames.mainScreen: (_) => screenFactory.makeMainScreen(),
  };

  @override
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch(settings.name){
      case MainNavigationRouteNames.profileDetails:
        final arguments = settings.arguments;
        final friendId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
            builder: (_)=> screenFactory.makeProfileDetails(friendId),
        );
      default:
        const widget = Text('Navigation error!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
