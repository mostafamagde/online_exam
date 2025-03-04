import 'package:online_exam/core/models/result.dart';

import '../../data/models/exam_model.dart';

abstract class GetExamsRepo {
  Future<Result<List<ExamModel>>> getExams(String subjectId);
}