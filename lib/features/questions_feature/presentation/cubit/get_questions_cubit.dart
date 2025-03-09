import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/core/models/result.dart';
import 'package:online_exam/features/questions_feature/data/models/questions_response.dart';
import 'package:online_exam/features/questions_feature/domain/use_cases/get_questions_use_case.dart';

part 'get_questions_state.dart';

class GetQuestionsCubit extends Cubit<GetQuestionsState> {
  final GetQuestionsUseCase _getQuestionsUseCase;

  GetQuestionsCubit(this._getQuestionsUseCase)
    : super(GetQuestionsState(status: Status.loading));

  Future<void> getQuestions(String examId) async {
    emit(state.copyWith(status: Status.loading));
    var response = await _getQuestionsUseCase.call(examId);
    switch (response) {
      case Success<QuestionsResponse>():
        emit(state.copyWith(status: Status.success, questions: response.data));
      case Error():
        emit(
          state.copyWith(status: Status.failure, exception: response.exception),
        );
    }
  }
}
