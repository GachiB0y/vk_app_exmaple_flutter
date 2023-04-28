import 'package:flutter/material.dart';
import 'package:vk_exmaple/Theme/app_colors.dart';
import 'package:vk_exmaple/ui/naviagtion/main_navigation_route_names.dart';

abstract class MyAppNavigation{
  Map <String, Widget Function(BuildContext)> get routes;
  Route<Object> onGenerateRoute(RouteSettings settings);
}

class MyApp extends StatelessWidget {
  final MyAppNavigation navigation;
  const MyApp({Key? key,required this.navigation}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.mainBlue,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            unselectedItemColor: Colors.grey,
          )
      ),
      routes: navigation.routes,
      initialRoute: MainNavigationRouteNames.loaderWidget,
      onGenerateRoute:navigation.onGenerateRoute,
    );
  }
}