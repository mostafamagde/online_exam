import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/profile/presentation/view_model/profile_state.dart';
import '../../domain/repository/profile_repository.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit(this.repository) : super(ProfileLoading());

  Future<void> getProfile() async {
    emit(ProfileLoading());
    try {
      final result = await repository.getProfile();
      emit(result);
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
