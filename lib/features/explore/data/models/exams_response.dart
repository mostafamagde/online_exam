import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/pagination_data.dart';
import 'exam_data.dart';
part 'exams_response.g.dart';
@JsonSerializable()
class ExamsResponse extends Equatable{
  final List<ExamData> exams;
  @JsonKey(name: 'metadata')
  final PaginationData pagination;
  const ExamsResponse({
    required this.exams,
    required this.pagination,
  });

  @override
  List<Object?> get props => [exams, pagination];
  factory ExamsResponse.fromJson(Map<String, dynamic> json) => _$ExamsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ExamsResponseToJson(this);


}