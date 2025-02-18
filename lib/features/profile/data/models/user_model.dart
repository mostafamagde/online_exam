import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {

  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;


  UserModel({

    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,

  });
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}