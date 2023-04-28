 import 'package:flutter/material.dart';
import 'package:vk_exmaple/ui/naviagtion/main_navigation_route_names.dart';
import 'package:vk_exmaple/widget/profil_details/profile_details_model.dart';

class MainNavigationAction implements UserDetailsModelMainNavigationActionProvider{
   const MainNavigationAction();

   void resetNavigation( BuildContext context){
    Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigationRouteNames.loaderWidget,
            (route) => false
    );
  }
 }