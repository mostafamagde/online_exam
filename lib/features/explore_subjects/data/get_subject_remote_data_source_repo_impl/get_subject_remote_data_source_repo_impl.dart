import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api_manager/api_execute.dart';
import 'package:online_exam/core/models/result.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';

import '../../../../core/api_manager/api_manager.dart';
import '../get_subject_remote_data_source_repo/get_subject_remote_data_source_repo.dart';

@Injectable(as: GetSubjectsDataSourceRepo)
class GetSubjectsDataSourceImpl implements GetSubjectsDataSourceRepo {
  final RestClient _restClient;

  GetSubjectsDataSourceImpl(this._restClient);

  @override
  Future<Result<List<SubjectModel>>> getSubjects() async {
    return ApiExecute.executeApi<List<SubjectModel>>(() async {
      final response = await _restClient.getSubjects();
      return response.subjects;
    });
  }
}
