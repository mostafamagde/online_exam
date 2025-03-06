import 'package:injectable/injectable.dart';
import 'package:online_exam/core/models/result.dart';
import 'package:online_exam/features/exam_feature/data/get_exams_by_subject_data_source/get_exams_by_subject_data_source.dart';
import 'package:online_exam/features/exam_feature/data/models/exam_model.dart';

import '../../../../core/api_manager/api_execute.dart';
import '../../../../core/api_manager/api_manager.dart';
@Injectable(as: GetExamsBySubjectDataSource)
class GetExamsBySubjectDataSourceImpl implements GetExamsBySubjectDataSource {
  final RestClient _restClient;
  GetExamsBySubjectDataSourceImpl(this._restClient);
  @override
  Future<Result<List<ExamModel>>> getExamsBySubject(String subjectId) async{
    return ApiExecute.executeApi<List<ExamModel>>(() async {
      final response = await _restClient.getExams(subjectId);
      return response.exams;
    });
    
  }
}