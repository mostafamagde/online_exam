import 'package:online_exam/features/profile/data/models/user_model.dart';

sealed class ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserModel user;
  ProfileSuccess(this.user);
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}


sealed class EditProfileState{}
class EditProfileLoading extends EditProfileState {}
class EditProfileSuccess extends EditProfileState {
  final UserModel user;
  EditProfileSuccess(this.user);
}
class EditProfileError extends EditProfileState {
  final String message;
  EditProfileError(this.message);
}
