import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/app_theme/app_theme.dart';

import 'core/di/di.dart';
import 'core/routes_manager/route_generator.dart';

void main()  {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}
