import 'package:injectable/injectable.dart';

import '../../../../core/models/result.dart';
import '../../domain/explore_repo/explore_repo.dart';
import '../get_subject_remote_data_source_repo/get_subject_remote_data_source_repo.dart';
import '../models/subject_model.dart';

@Injectable(as: ExploreRepo)
class ExploreRepoImpl implements ExploreRepo {
  final GetSubjectsDataSourceRepo _dataSourceRepo;

  ExploreRepoImpl(this._dataSourceRepo);

  @override
  Future<Result<List<SubjectModel>>> getSubjects() async {
    return await _dataSourceRepo.getSubjects();
  }
}
