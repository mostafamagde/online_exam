import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_model.g.dart';

@JsonSerializable()
class ExamModel extends Equatable {

  @JsonKey(name: '_id')
  final String id;
  final String title;
  final int duration;
  final String subject;
  final int numberOfQuestions;
  final bool active;
  final DateTime createdAt;

   const ExamModel({

    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
    required this.createdAt,
  });
  factory ExamModel.fromJson(Map<String, dynamic> json) => _$ExamModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExamModelToJson(this);




  @override
  List<Object?> get props => [
    id,
    title,
    duration,
    subject,
    numberOfQuestions,
    active,
    createdAt,

  ];
}
