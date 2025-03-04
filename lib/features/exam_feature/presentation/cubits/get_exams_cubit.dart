import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/result.dart';
import '../../../../core/routes_manager/routes_names.dart';
import '../../domain/use_cases/get_exams_per_subject_use_case.dart';
import 'get_exams_state.dart';

class GetExamsCubit extends Cubit<GetExamsState> {
  final GetExamsPerSubjectUseCase _getExamsPerSubjectUseCase;

  GetExamsCubit(this._getExamsPerSubjectUseCase)
    : super(GetExamsState(status: States.loading));

  static GetExamsCubit get(context) => BlocProvider.of(context);

  void doIntent(GetExamsIntent intent)  {
    switch (intent) {
      case LoadExamsIntent():
        _loadExams(intent.subjectId);
      case ExamClicked():
        _examClicked(intent.context, intent.examId,intent.subjectName);

    }
  }
void _examClicked(BuildContext context, String examId, String subjectName) {
    Navigator.pushNamed(context, RoutesNames.examDetails,arguments: [examId,subjectName]);
  }
  Future<void> _loadExams(String subjectId) async {
    emit(state.copyWith(state: States.loading));
    var result = await _getExamsPerSubjectUseCase.call(subjectId);
    switch (result) {
      case Success():
        emit(state.copyWith(exams: result.data, state: States.success));
      case Error():
        emit(
          state.copyWith(exception: result.exception, state: States.failure),
        );
    }
  }
}

sealed class GetExamsIntent {}

class LoadExamsIntent extends GetExamsIntent {
  final String subjectId;

  LoadExamsIntent({required this.subjectId});
}

class ExamClicked extends GetExamsIntent {
  BuildContext context;
  String examId;
  String subjectName;


  ExamClicked({required this.examId, required this.context,required this.subjectName});
}
