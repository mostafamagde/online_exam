import '../../data/models/user_model.dart';
import '../../presentation/view_model/profile_state.dart';

abstract class ProfileRepository {
  Future<ProfileState> getProfile(String token);

  Future<EditProfileState> editProfile(String token, UserModel user);
}