import 'package:injectable/injectable.dart';
import 'package:online_exam/features/exam_feature/data/models/exams_response.dart';

import '../../../../core/models/result.dart';
import '../../domain/explore_repo/explore_repo.dart';
import '../models/subject_model.dart';
import '../remote_data_source_repo/remote_data_source_repo.dart';
@Injectable(as: ExploreRepo)
class ExploreRepoImpl implements ExploreRepo {
final DataSourceRepo _dataSourceRepo;

  ExploreRepoImpl(this._dataSourceRepo);
  @override
  Future<Result<List<SubjectModel>>> getSubjects() async{
    return await _dataSourceRepo.getSubjects();


  }
}