import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';

import '../../../../../core/constants/constants.dart';

class SubjectContainerContent extends StatelessWidget {
  final SubjectModel subjects;
  const SubjectContainerContent({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    return  Row(
      children: [
        SizedBox(width: 20),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),

          child: CachedNetworkImage(
            imageUrl: subjects.icon,
            errorWidget:
                (context, url, error) => Icon(Icons.error),
            height: 40,
            placeholder:
                (context, url) => Center(
              child: CircularProgressIndicator(
                color: Constants.primaryColor,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Text(
          subjects.name,
          style: theme.textTheme.titleLarge?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
