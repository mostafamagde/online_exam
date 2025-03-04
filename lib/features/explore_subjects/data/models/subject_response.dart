import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';


import '../../../../core/models/pagination_data.dart';


part 'subject_response.g.dart';

@JsonSerializable()
class SubjectResponse extends Equatable{
  @JsonKey(name: 'metadata')
   PaginationData pagination;
  List<SubjectModel> subjects;

  SubjectResponse(this.pagination, {required this.subjects});

  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResponseToJson(this);

  @override

  List<Object?> get props => [pagination, subjects];


}
