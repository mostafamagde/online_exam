import 'package:online_exam/core/models/result.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';

abstract class GetSubjectsDataSourceRepo {
  Future<Result<List<SubjectModel>>> getSubjects();
}
