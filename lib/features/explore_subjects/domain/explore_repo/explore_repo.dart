
import 'package:online_exam/core/models/result.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';

import '../../../exam_feature/data/models/exams_response.dart';

abstract class ExploreRepo {
  Future<Result<List<SubjectModel>>>getSubjects();

}