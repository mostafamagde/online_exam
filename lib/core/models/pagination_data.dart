
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_data.g.dart';

@JsonSerializable()
class PaginationData extends Equatable{
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  const PaginationData({
    this.currentPage,
    this.numberOfPages ,
    this.limit ,
  });

  @override

  List<Object?> get props => [currentPage];

  factory PaginationData.fromJson(Map<String, dynamic> json) => _$PaginationDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDataToJson(this);
}

