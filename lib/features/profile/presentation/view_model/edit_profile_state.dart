import '../../data/models/user_model.dart';

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