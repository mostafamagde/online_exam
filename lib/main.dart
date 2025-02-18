import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/layout/presentation/layout_view.dart';
import 'package:online_exam/features/profile/domain/repository/profile_repository.dart';
import 'package:online_exam/features/profile/presentation/view_model/edit_profile_cubit.dart';

import 'core/di/di.dart';
import 'core/navigation_cubit/navigation_cubit.dart';
import 'core/routes_manager/route_generator.dart';
import 'features/profile/presentation/view_model/profile_cubit.dart';

void main() {
  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => ProfileCubit(getIt<ProfileRepository>())),
        BlocProvider(create: (context) => EditProfileCubit(getIt<ProfileRepository>())),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutView(),
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your appliation with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}

