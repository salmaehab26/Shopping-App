import 'package:flutter/cupertino.dart';
import 'package:shopping/Core/routes_manager/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Features/Home/homeScreen.dart';
import 'package:shopping/Features/Splash_Screen/Splash_Screen.dart';

import '../../Features/auth/log_in/log_in_screen.dart';
import '../../Features/auth/sign_up/sign_up_screen.dart';



class RoutesGenerator{
  static Route<dynamic> getRoutes(RouteSettings settings){
    switch (settings.name) {
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder:(_)=> LoginScreen());
      case AppRoutes.signupRoute:
        return MaterialPageRoute(builder:(_)=>const Sign_Up());
      case AppRoutes.splashScreen:
      return MaterialPageRoute(builder:(_)=> SplashScreen());
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder:(_)=>const Homescreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}