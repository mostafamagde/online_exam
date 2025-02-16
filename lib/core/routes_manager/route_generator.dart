import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/core/routes_manager/routes_names.dart';

import '../../features/layout/presentation/layout_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.layout:
        return MaterialPageRoute(
          builder: (context) => LayoutView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );
    }
  }
}
