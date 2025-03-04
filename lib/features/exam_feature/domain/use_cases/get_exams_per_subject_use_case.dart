import 'package:injectable/injectable.dart';

import '../../../../core/models/result.dart';
import '../../data/models/exam_model.dart';
import '../get_exams_repo/get_exams_repo.dart';

@injectable
class GetExamsPerSubjectUseCase {
  final GetExamsRepo _getExamsRepo;

  GetExamsPerSubjectUseCase(this._getExamsRepo);
  Future<Result<List<ExamModel>>> call(String subjectId) async {
    return await _getExamsRepo.getExams(subjectId);
  }

}