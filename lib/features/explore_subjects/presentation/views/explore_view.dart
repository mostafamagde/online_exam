import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/constants/constants.dart';
import 'package:online_exam/core/routes_manager/routes_names.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';
import 'package:online_exam/features/explore_subjects/presentation/views/widgets/search_text_field.dart';
import 'package:online_exam/features/explore_subjects/presentation/views/widgets/subject_container.dart';

import '../../../../core/exceptions/ErrorMessageHandler.dart';
import '../cubits/explore_cubit.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        switch (state.status) {
          case States.loading:
            return const Center(
              child: CircularProgressIndicator(color: Constants.primaryColor),
            );
          case States.success:
            return successWidget(state.subjects!, theme);
          case States.failure:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(Icons.error, color: Colors.red, size: 50),
                  SizedBox(height:20),
                  Text(handleErrorMessage(state.exception, context),style: theme.textTheme.titleLarge,),
                ],
              ),
            );
        }
      },
    );
  }
}

Widget successWidget(List<SubjectModel> subjects, ThemeData theme) {
  return Padding(
    padding: EdgeInsets.only(top: 56, left: 16, right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Survey",
          style: theme.textTheme.titleLarge?.copyWith(
            color: Constants.primaryColor,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 15),
        SearchTextField(),
        SizedBox(height: 40),
        Text("Browse by Subject", style: theme.textTheme.titleLarge),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: InkWell(
                  onTap:
                      () => Navigator.pushNamed(
                        context,
                        RoutesNames.examsBySubject,
                        arguments: subjects[index],
                      ),
                  child: SubjectContainer(subjects: subjects[index]),
                ),
              );
            },
            itemCount: subjects.length,
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    ),
  );
}
