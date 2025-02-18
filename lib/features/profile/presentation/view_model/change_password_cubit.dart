
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/profile/data/models/change_password_request.dart';
import 'package:online_exam/features/profile/domain/repository/profile_repository.dart';
import 'package:online_exam/features/profile/presentation/view_model/profile_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState>{
  final ProfileRepository repository;
  ChangePasswordCubit(this.repository) :super(ChangePasswordLoading());

  Future<void> changePassword(String token,ChangePasswordRequest request)async{
    emit(ChangePasswordLoading());
    final result = await repository.changePassword(request, token);

    if(result is ChangePasswordSuccess){
      emit(ChangePasswordSuccess(result.message));
    }else if (result is ChangePasswordError){
      emit(ChangePasswordError(result.message));
    }
  }

}