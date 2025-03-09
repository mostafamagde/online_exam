part of 'get_questions_cubit.dart';

enum Status { loading, success, failure }
 class GetQuestionsState  extends Equatable{
   Status status;
   QuestionsResponse? questions;
   Exception? exception;

   GetQuestionsState({
    required this.status,
     this.questions,
     this.exception,
  });
  GetQuestionsState copyWith({
    Exception? exception,
    QuestionsResponse? questions,
    Status? status,
  }) {
    return GetQuestionsState(
      exception: exception ?? this.exception,
      questions: questions ?? this.questions,
      status: status ?? this.status,
    );
  }
  @override
  List<Object?> get props => [status, questions,exception];
}


