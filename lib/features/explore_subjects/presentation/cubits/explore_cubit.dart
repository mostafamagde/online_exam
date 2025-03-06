import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/models/result.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';

import '../../../../core/routes_manager/routes_names.dart';
import '../../domain/use_cases/get_subjects_usecase.dart';

part 'explore_state.dart';

@injectable
class ExploreCubit extends Cubit<ExploreState> {
  final GetSubjectsUseCase _getSubjectsUseCase;

  ExploreCubit(this._getSubjectsUseCase)
    : super(ExploreState(status: States.loading));

  static ExploreCubit get(context) => BlocProvider.of(context);

  void doIntent(ExploreIntent intent)  {
    switch (intent) {
      case LoadSubjectsIntent():
        _loadSubjects();
      case SubjectClickedIntent():
        _subjectClicked(intent.context, intent.subject);
    }
  }

  Future<void> _loadSubjects() async {
    emit(state.copyWith(state: States.loading));
    var result = await _getSubjectsUseCase.call();
    switch (result) {
      case Success():
        emit(state.copyWith(subjects: result.data, state: States.success));
      case Error():
        emit(
          state.copyWith(exception: result.exception, state: States.failure),
        );
    }
  }

  void _subjectClicked(BuildContext context, SubjectModel subject) {
    Navigator.pushNamed(
      context,
      RoutesNames.examsBySubject,
      arguments: subject,
    );
  }
}

sealed class ExploreIntent {}

class LoadSubjectsIntent extends ExploreIntent {
  List<SubjectModel>? subject;

  LoadSubjectsIntent({this.subject});
}

class SubjectClickedIntent extends ExploreIntent {
  BuildContext context;
  SubjectModel subject;

  SubjectClickedIntent({required this.context, required this.subject});
}
