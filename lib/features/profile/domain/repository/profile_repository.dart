import '../../data/models/change_password_request.dart';
import '../../data/models/user_model.dart';
import '../../presentation/view_model/change_password_state.dart';
import '../../presentation/view_model/edit_profile_state.dart';
import '../../presentation/view_model/profile_state.dart';

abstract class ProfileRepository {
  Future<ProfileState> getProfile(String token);

  Future<EditProfileState> editProfile(String token, UserModel user);
  Future<ChangePasswordState> changePassword(ChangePasswordRequest password, String token);
}