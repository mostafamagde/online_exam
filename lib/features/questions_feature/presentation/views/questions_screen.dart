import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/constants/constants.dart';
import '../../../../core/exceptions/ErrorMessageHandler.dart';
import '../../../../core/widgets/main_button.dart';
import '../cubit/get_questions_cubit.dart';
import '../../domain/use_cases/get_questions_use_case.dart';
import 'package:online_exam/core/di/di.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentIndex = 0;
  Map<int, List<int>> userAnswers = {};
  Timer? _timer;
  int _remainingTime = 0;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer(int duration) {
    _remainingTime = duration * 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
        _showTimeOutDialog();
      }
    });
  }

  void _showTimeOutDialog() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: SizedBox(
              width: 289,
              height: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Time is Out !!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFCC1010),
                      fontWeight: FontWeight.w500,
                      fontFamily: Constants.fontFamily,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: MainButton(
                      label: "View Score",
                      backgroundColor: Constants.primaryColor,
                      onPress: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var examId = ModalRoute.of(context)?.settings.arguments as String;
    var theme = Theme.of(context);

    return BlocProvider(
      create:
          (context) =>
              GetQuestionsCubit(getIt<GetQuestionsUseCase>())
                ..getQuestions(examId),
      child: BlocBuilder<GetQuestionsCubit, GetQuestionsState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: Constants.primaryColor),
              ),
            );
          }
          if (state.status == Status.failure) {
            return Scaffold(
              body: Center(
                child: Text(handleErrorMessage(state.exception, context)),
              ),
            );
          }

          var questions = state.questions?.questions ?? [];
          if (questions.isEmpty) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(child: Text("No questions available")),
            );
          }

          var question = questions[currentIndex];
          bool isMultipleChoice = question.type == "single_choice";
          double progress = (currentIndex + 1) / questions.length;

          if (_timer == null) {
            _startTimer(state.questions!.questions[0].exam.duration);
          }

          return Scaffold(
            appBar: AppBar(
              title: Text("Exam", style: theme.textTheme.titleLarge),
              actions: [
                Icon(Icons.alarm, size: 28),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "${(_remainingTime ~/ 60)}:${(_remainingTime % 60) < 10 ? "0${(_remainingTime % 60)}" : (_remainingTime % 60)}",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color:
                          _remainingTime ~/ 60 > 14
                              ? Color(0xFF11CE19)
                              : Color(0xFFCC1010),
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Question ${currentIndex + 1} of ${questions.length}",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  LinearProgressIndicator(
                    value: progress,
                    minHeight: 4,
                    color: Constants.primaryColor,
                  ),
                  SizedBox(height: 10),
                  Text(
                    question.question,
                    style: theme.textTheme.titleLarge?.copyWith(fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: List.generate(question.answers.length, (index) {
                      bool isSelected =
                          userAnswers[currentIndex]?.contains(index) ?? false;
                      return !isMultipleChoice
                          ? Padding(
                            padding: EdgeInsets.all(10),
                            child: CheckboxListTile(
                              activeColor: Constants.primaryColor,

                              tileColor:
                                  userAnswers[currentIndex]?.contains(index) ??
                                          false
                                      ? Color(0xFFCCD7EB)
                                      : Color(0xFFEDEFF3),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: Text(question.answers[index].answer),
                              value: isSelected,
                              onChanged:
                                  (_) => setState(() {
                                    userAnswers.putIfAbsent(
                                      currentIndex,
                                      () => [],
                                    );
                                    isSelected
                                        ? userAnswers[currentIndex]?.remove(
                                          index,
                                        )
                                        : userAnswers[currentIndex]?.add(index);
                                  }),
                            ),
                          )
                          : Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: RadioListTile<int>(
                              activeColor: Constants.primaryColor,
                              fillColor: WidgetStatePropertyAll(
                                Constants.primaryColor,
                              ),
                              tileColor:
                                  userAnswers[currentIndex]?.contains(index) ??
                                          false
                                      ? Color(0xFFCCD7EB)
                                      : Color(0xFFEDEFF3),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: Text(
                                question.answers[index].answer,
                                style: TextStyle(color: Colors.black),
                              ),
                              value: index,
                              groupValue:
                                  userAnswers[currentIndex]?.isNotEmpty ?? false
                                      ? userAnswers[currentIndex]!.first
                                      : -1,
                              onChanged:
                                  (_) => setState(() {
                                    userAnswers[currentIndex] = [
                                      index,
                                    ]; // Single selection
                                  }),
                            ),
                          );
                    }),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(163, 48),
                          maximumSize: Size(163, 48),

                          backgroundColor: Colors.white,
                          disabledBackgroundColor: Colors.white,

                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Constants.primaryColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        onPressed:
                            currentIndex > 0
                                ? () => setState(() => currentIndex--)
                                : null,
                        child: Text(
                          "Back",
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: Constants.primaryColor,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(163, 48),
                          maximumSize: Size(163, 48),
                          backgroundColor: Constants.primaryColor,

                          disabledBackgroundColor: Constants.primaryColor,

                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Constants.primaryColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        onPressed: () {
                          if (currentIndex < questions.length - 1) {
                            setState(() => currentIndex++);
                          } else {
                            print(userAnswers);
                            showDialog(
                              context: context,
                              builder:
                                  (_) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    content: SizedBox(
                                      width: 289,
                                      height: 230,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            "You answered ${userAnswers.length} questions out of ${questions.length}",
                                            textAlign: TextAlign.center,
                                            style: theme.textTheme.titleLarge,
                                          ),
                                          SizedBox(height: 25),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 15,
                                            ),
                                            child: MainButton(
                                              label: "view score",
                                              backgroundColor:
                                                  Constants.primaryColor,
                                              onPress: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            );
                          }
                        },
                        child: Text(
                          currentIndex == questions.length - 1
                              ? "Finish"
                              : "Next",
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
