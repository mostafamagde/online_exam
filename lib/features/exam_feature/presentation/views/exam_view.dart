import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/exam_feature/data/models/exam_model.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/di/di.dart';
import '../../../../core/exceptions/ErrorMessageHandler.dart';
import '../../domain/use_cases/get_exams_per_subject_use_case.dart';
import '../cubits/get_exams_cubit.dart';
import '../cubits/get_exams_state.dart';

class ExamView extends StatelessWidget {
  const ExamView({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as SubjectModel;

    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(arguments.name)),
      body: BlocProvider(
        create:
            (context) =>
                GetExamsCubit(getIt<GetExamsPerSubjectUseCase>())
                  ..doIntent(LoadExamsIntent(subjectId: arguments.id)),
        child: BlocBuilder<GetExamsCubit, GetExamsState>(
          builder: (context, state) {
            switch (state.status) {
              case States.loading:
                return Center(
                  child: CircularProgressIndicator(
                    color: Constants.primaryColor,
                  ),
                );
              case States.success:
                if (state.exams!.isEmpty) {
                  return Center(
                    child: Text(
                      "No Exams Found",
                      style: theme.textTheme.titleLarge,
                    ),
                  );
                }
                return _successWidget(
                  state.exams!,
                  arguments.icon,
                  theme,
                  context,
                  arguments.name,
                );

              case States.failure:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(Icons.error, color: Colors.red, size: 50),
                      SizedBox(height: 20),
                      Text(
                        handleErrorMessage(state.exception, context),
                        style: theme.textTheme.titleLarge,
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

Widget _successWidget(
  List<ExamModel> exams,
  String icon,
  ThemeData theme,
  BuildContext context,
  String subjectName,
) {
  var cubit = GetExamsCubit.get(context);
  return Column(
    children: [
      Expanded(
        child: ListView.builder(
          itemCount: exams.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap:
                  () => cubit.doIntent(
                    ExamClicked(
                      context: context,
                      args: [
                        exams[index].id,
                        subjectName,
                        exams[index].numberOfQuestions.toString(),
                        icon,
                      ],
                    ),
                  ),
              child: Container(
                margin: EdgeInsets.all(10),
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,

                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: CachedNetworkImage(
                              imageUrl: icon,
                              errorWidget:
                                  (context, url, error) => Icon(Icons.error),
                              height: 55,

                              placeholder:
                                  (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      color: Constants.primaryColor,
                                    ),
                                  ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exams[index].title,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Questions: ${exams[index].numberOfQuestions.toString()}",
                                style: theme.textTheme.titleMedium,
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "${exams[index].numberOfQuestions.toString()} Minutes",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF02369C),
                              fontFamily: Constants.fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
