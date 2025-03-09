
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/profile/data/models/user_model.dart';
import 'package:online_exam/features/profile/domain/repository/profile_repository.dart';

import 'edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState>{
  final ProfileRepository repository;
  EditProfileCubit(this.repository) :super(EditProfileLoading());

  Future<void> editProfile(UserModel user)async{
    emit(EditProfileLoading());
    final result = await repository.editProfile( user);

    if(result is EditProfileSuccess){
      emit(EditProfileSuccess( result.user));
    }else if (result is EditProfileError){
      emit(EditProfileError(result.message));
    }
  }

}
