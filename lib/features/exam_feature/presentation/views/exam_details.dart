import 'package:flutter/material.dart';

class ExamDetails extends StatelessWidget {
  const ExamDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as List<String>;
    return Scaffold(
      appBar: AppBar(
        title:  Text(arguments[1]),
      ),
    );
  }
}
