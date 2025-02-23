import 'package:flutter/material.dart';
import 'package:online_exam/core/api_manager/api_manager.dart';
import 'package:online_exam/features/explore/data/models/exam_data.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'core/di/di.dart';
import 'core/routes_manager/route_generator.dart';

void main() async {
  configureDependencies();
  final dio = Dio();
  dio.options.headers = {
    'token':
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjcyOGYwODZhMDI0ZjA2ZWEyODZkYiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQwMDU2OTExfQ.A34jo1EITjVyAP272-yj9_SV0kOWm1YO3NeGtRfgwMQ",
  };
  final client = RestClient(dio);
  await client.getExams().then((it) => print(it));
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
