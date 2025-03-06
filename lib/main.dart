import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/layout/presentation/layout_view.dart';
import 'package:online_exam/features/profile/domain/repository/profile_repository.dart';
import 'package:online_exam/features/profile/presentation/view/Screens/change_password_screen.dart';
import 'package:online_exam/features/profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/app_theme/app_theme.dart';

import 'core/di/di.dart';
import 'core/navigation_cubit/navigation_cubit.dart';
import 'core/routes_manager/route_generator.dart';
import 'features/profile/presentation/view_model/change_password_cubit.dart';
import 'features/profile/presentation/view_model/profile_cubit.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
  runApp(MyApp());
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
