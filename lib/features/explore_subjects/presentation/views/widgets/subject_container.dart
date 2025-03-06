import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';
import 'package:online_exam/features/explore_subjects/presentation/views/widgets/subject_container_content.dart';

import '../../../../../core/constants/constants.dart';

class SubjectContainer extends StatelessWidget {
  final SubjectModel subjects;

  const SubjectContainer({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,

        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SubjectContainerContent(subjects: subjects),
    );
  }
}
