import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/profile/data/models/user_model.dart';

part 'profile_response_model.g.dart';
@JsonSerializable()
class ProfileResponseModel {
  String message;
  UserModel user;
  ProfileResponseModel(this.message, this.user);

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}
