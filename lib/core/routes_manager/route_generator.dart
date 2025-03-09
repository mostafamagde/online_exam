import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/routes_manager/routes_names.dart';
import 'package:online_exam/features/profile/presentation/view/Screens/edit_profile_screen.dart';
import 'package:online_exam/features/profile/presentation/view/Screens/profile_screen.dart';

import '../../features/exam_feature/domain/use_cases/get_exams_per_subject_use_case.dart';
import '../../features/exam_feature/presentation/cubits/get_exams_cubit.dart';
import '../../features/exam_feature/presentation/views/exam_details.dart';
import '../../features/exam_feature/presentation/views/exam_view.dart';
import '../../features/exam_feature/presentation/views/exam_details.dart';
import '../../features/exam_feature/presentation/views/exam_view.dart';
import '../../features/layout/presentation/layout_view.dart';
import '../../features/profile/domain/repository/profile_repository.dart';
import '../../features/profile/presentation/view_model/change_password_cubit.dart';
import '../../features/profile/presentation/view_model/edit_profile_cubit.dart';
import '../../features/questions_feature/presentation/views/questions_screen.dart';
import '../di/di.dart';
import '../../features/profile/presentation/view/Screens/change_password_screen.dart';
import '../../features/profile/presentation/view/Screens/change_password_screen.dart';
import '../../features/profile/presentation/view/Screens/edit_profile_screen.dart';
import '../../features/profile/presentation/view/Screens/profile_screen.dart';
import '../navigation_cubit/navigation_cubit.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.layout:
        return MaterialPageRoute(
          builder:
              (context) =>
              BlocProvider(
                create: (context) => NavigationCubit(),
                child: LayoutView(),
              ),
          settings: settings,
        );
      case RoutesNames.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case RoutesNames.editProfile:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => EditProfileCubit(getIt<ProfileRepository>()),
              child: EditProfileScreen(),
            ));

      case RoutesNames.changePassword:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => ChangePasswordCubit(getIt<ProfileRepository>()),
              child: ChangePasswordScreen(),
            ));
      case RoutesNames.examsBySubject:
        return MaterialPageRoute(
          builder:
              (context) => ExamView(),
          settings: settings,
        );
      case RoutesNames.questionsView:
        return MaterialPageRoute(
          builder:
              (context) => QuestionsScreen(),
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
