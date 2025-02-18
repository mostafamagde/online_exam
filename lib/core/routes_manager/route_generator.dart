import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/routes_manager/routes_names.dart';
import 'package:online_exam/features/profile/presentation/view/Screens/edit_profile_screen.dart';
import 'package:online_exam/features/profile/presentation/view/Screens/profile_screen.dart';

import '../../features/layout/presentation/layout_view.dart';
import '../../features/profile/presentation/view/Screens/change_password_screen.dart';
import '../navigation_cubit/navigation_cubit.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.layout:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => NavigationCubit(),
                child: LayoutView(),
              ),
          settings: settings,
        );
      case RoutesNames.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case RoutesNames.editProfile:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());

      case RoutesNames.changePassword:
        return MaterialPageRoute(builder: (_)=> ChangePasswordScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );
    }
  }
}
