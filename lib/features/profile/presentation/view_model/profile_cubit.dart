import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/profile/presentation/view_model/profile_state.dart';
import '../../domain/repository/profile_repository.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit(this.repository) : super(ProfileLoading());

  Future<void> getProfile(String token) async {
    emit(ProfileLoading());
    final result = await repository.getProfile(token);

    if (result is ProfileSuccess) {
      emit(ProfileSuccess(result.user));
    } else if (result is ProfileError) {
      emit(ProfileError(result.message));
    }
  }
}
