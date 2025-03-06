import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/exam_feature/data/models/exam_model.dart';

enum States { loading, success, failure }


class GetExamsState extends Equatable {
  List<ExamModel>? exams;
  States status;
  Exception? exception;

  GetExamsState({this.exams, required this.status, this.exception});

  GetExamsState copyWith({
    Exception? exception,
    List<ExamModel>? exams,
    States? state,
  }) {
    return GetExamsState(
      exception: exception ?? this.exception,
      exams: exams ?? exams,
      status: state ?? status,
    );
  }

  @override
  List<Object?> get props => [exams, status, exception];
}
