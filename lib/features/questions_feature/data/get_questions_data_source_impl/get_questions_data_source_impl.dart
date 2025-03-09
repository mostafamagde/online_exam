import 'package:injectable/injectable.dart';
import 'package:online_exam/core/models/result.dart';

import 'package:online_exam/features/questions_feature/data/models/questions_response.dart';

import '../../../../core/api_manager/api_execute.dart';
import '../../../../core/api_manager/api_manager.dart';
import '../get_questions_data_source/get_questions_data_source.dart';

@Injectable(as: GetQuestionsDataSource)
class GetQuestionsDataSourceImpl implements GetQuestionsDataSource {
  final RestClient _restClient;
  GetQuestionsDataSourceImpl(this._restClient);
  @override
  Future<Result<QuestionsResponse>> getQuestions( String examId) async {
    return ApiExecute.executeApi<QuestionsResponse>(() async {

      return await _restClient.getQuestions(examId);
    },);
  }
}
