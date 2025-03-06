import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Core/routes_manager/routes_generators.dart';

import 'Core/app_theme.dart';
import 'Core/my_bloc_observer.dart';
import 'Core/routes_manager/app_routes.dart';
import 'Features/Splash_Screen/Splash_Screen.dart';
import 'Features/auth/log_in/log_in_screen.dart';

void main()  {
  Bloc.observer = MyBlocObserver();
  runApp( MyApp());

  }

class MyApp extends StatelessWidget {
  MyApp( {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            onGenerateRoute: RoutesGenerator.getRoutes,
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splashScreen,
            theme: AppTheme.mainTheme,
          );
        });
  }
}

