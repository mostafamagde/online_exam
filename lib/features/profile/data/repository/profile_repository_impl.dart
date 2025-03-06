import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:online_exam/features/profile/data/models/change_password_request.dart';

import '../../../../core/api_manager/api_manager.dart';
import '../../domain/repository/profile_repository.dart';
import '../../presentation/view_model/change_password_state.dart';
import '../../presentation/view_model/edit_profile_state.dart';
import '../../presentation/view_model/profile_state.dart';
import '../models/user_model.dart';


@Injectable(as:ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final RestClient api;

  ProfileRepositoryImpl(this.api);

  @override
  Future<ProfileState> getProfile() async {
    try {
      final response = await api.getProfile();
      return ProfileSuccess(response.user);

    } catch (e) {
      print(e.toString());
      return ProfileError("Failed to load profile");
    }
  }

  @override
  Future<EditProfileState> editProfile(  UserModel user) async {
    try {
      final response = await api.editProfile( user);
      return EditProfileSuccess( response.user);
    } catch (e) {
      return EditProfileError("Failed to update profile");
    }
  }

  @override
  Future<ChangePasswordState> changePassword(ChangePasswordRequest password) async {
    try {
      final response = await api.changePassword( password);

      if (response.response.statusCode == 200) {
        return ChangePasswordSuccess("Password Changed Successfully");
      } else {
        return ChangePasswordError("Failed to change password");
      }
    } catch (e) {
      log("Error changing password: $e");
      return ChangePasswordError("An unexpected error occurred while changing the password");
    }
  }
}


