import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/pagination_data.dart';
import '../../../exam_feature/data/models/exam_model.dart';

part 'exams_response.g.dart';

@JsonSerializable()
class ExamsResponse extends Equatable {
   List<ExamModel> exams;
  @JsonKey(name: 'metadata')
  final PaginationData pagination;

   ExamsResponse({required this.exams, required this.pagination});

  @override
  List<Object?> get props => [exams, pagination];

  factory ExamsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamsResponseToJson(this);
}
