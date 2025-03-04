import '../../../../core/models/result.dart';
import '../models/exam_model.dart';


abstract class GetExamsBySubjectDataSource {
  Future<Result<List<ExamModel>>> getExamsBySubject(String subjectId);
}