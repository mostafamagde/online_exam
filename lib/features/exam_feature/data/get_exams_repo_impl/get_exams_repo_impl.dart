import 'package:injectable/injectable.dart';
import 'package:online_exam/core/models/result.dart';

import 'package:online_exam/features/exam_feature/data/models/exam_model.dart';

import '../../domain/get_exams_repo/get_exams_repo.dart';
import '../get_exams_by_subject_data_source/get_exams_by_subject_data_source.dart';
@Injectable(as: GetExamsRepo)
class GetExamsRepoImpl implements GetExamsRepo {
  final GetExamsBySubjectDataSource _dataSource;
  GetExamsRepoImpl(this._dataSource);
  @override
  Future<Result<List<ExamModel>>> getExams( String subjectId) async{
    return await _dataSource.getExamsBySubject(subjectId);
  }

}