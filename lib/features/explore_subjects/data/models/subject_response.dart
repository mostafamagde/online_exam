import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/explore_subjects/data/models/subject_model.dart';


import '../../../../core/models/pagination_data.dart';
import '../../domain/entities/subject_entity.dart';

part 'subject_response.g.dart';

@JsonSerializable()
class SubjectResponse {
  @JsonKey(name: 'metadata')
  final PaginationData pagination;
  List<SubjectModel> subjects;

  SubjectResponse(this.pagination, {required this.subjects});

  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResponseToJson(this);


}
