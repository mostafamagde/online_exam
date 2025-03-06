part of 'explore_cubit.dart';

enum States { loading, success, failure }

@injectable
class ExploreState extends Equatable {
  List<SubjectModel>? subjects;
  States status;
  Exception? exception;

  ExploreState({ this.subjects, required this.status,this
  .exception});


ExploreState copyWith ({ Exception? exception, List<SubjectModel>? subjects, States? state}){
  return ExploreState(
    exception: exception ?? this.exception,
    subjects: subjects ?? this.subjects,
    status: state ?? status,
  );
}


  @override
  List<Object?> get props => [subjects,status,exception];
}
