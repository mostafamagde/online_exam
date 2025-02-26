import 'package:flutter/material.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';

class ExamView extends StatelessWidget {
  const ExamView({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as SubjectModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.name),
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
