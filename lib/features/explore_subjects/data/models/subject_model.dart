import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';



part 'subject_model.g.dart';

@JsonSerializable()
class SubjectModel extends Equatable {
  @JsonKey(name: "_id")
  final String id;
  final String name;
  final String icon;
  final DateTime createdAt;

  SubjectModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.createdAt,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) => _$SubjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);

  @override
  List<Object?> get props => [id, name, icon, createdAt];


}
