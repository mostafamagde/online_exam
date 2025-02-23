import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/pagination_data.dart';
part 'exam_data.g.dart';

@JsonSerializable()
class ExamData extends Equatable {

  @JsonKey(name: '_id')
  final String id;
  final String title;
  final int duration;
  final String subject;
  final int numberOfQuestions;
  final bool active;
  final DateTime createdAt;

   ExamData({

    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
    required this.createdAt,
  });
  factory ExamData.fromJson(Map<String, dynamic> json) => _$ExamDataFromJson(json);
  Map<String, dynamic> toJson() => _$ExamDataToJson(this);




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
