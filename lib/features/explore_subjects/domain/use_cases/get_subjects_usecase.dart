import 'package:injectable/injectable.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';

import '../../../../core/models/result.dart';

import '../explore_repo/explore_repo.dart';

@injectable
class GetSubjectsUseCase {
  final ExploreRepo subjectsRepository;

  GetSubjectsUseCase(this.subjectsRepository);

  Future<Result<List<SubjectModel>>> call() async {
    return await subjectsRepository.getSubjects();
  }
}
