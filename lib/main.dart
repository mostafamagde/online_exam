import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'core/di/di.dart';
import 'core/routes_manager/route_generator.dart';

void main() async {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}
