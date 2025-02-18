import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../../domain/repository/profile_repository.dart';
import '../../presentation/view_model/profile_state.dart';
import '../models/user_model.dart';
import '../remot_datasource/profile_api.dart';

@Injectable(as:ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApi api;

  ProfileRepositoryImpl(this.api);

  @override
  Future<ProfileState> getProfile(String token) async {
    try {
      final response = await api.getProfile(token);
      return ProfileSuccess(response.user);

    } catch (e) {
      print(e.toString());
      return ProfileError("Failed to load profile");
    }
  }

  @override
  Future<EditProfileState> editProfile(String token, UserModel user) async {
    try {
      final response = await api.editProfile(token, user);
      return EditProfileSuccess(response.user);
    } catch (e) {
      return EditProfileError("Failed to update profile");
    }
  }}
