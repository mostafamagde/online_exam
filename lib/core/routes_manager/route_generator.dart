import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/routes_manager/routes_names.dart';

import '../../features/exam_feature/domain/use_cases/get_exams_per_subject_use_case.dart';
import '../../features/exam_feature/presentation/cubits/get_exams_cubit.dart';
import '../../features/exam_feature/presentation/views/exam_details.dart';
import '../../features/exam_feature/presentation/views/exam_view.dart';
import '../../features/layout/presentation/layout_view.dart';
import '../di/di.dart';
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
      case RoutesNames.examsBySubject:
        return MaterialPageRoute(
          builder:
              (context) => ExamView(),
          settings: settings,
        );

      case RoutesNames.examDetails:
        return MaterialPageRoute(
          builder: (context) => ExamDetails(),
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
