import 'package:json_annotation/json_annotation.dart';
part 'data_model.g.dart';
@JsonSerializable()
class DataModel
{
  final String author;
  final String images;

  @JsonKey(name: 'inshorts-link')
  final String inshortsLink;

  @JsonKey(name: 'read-more')
  final String readMore;
  final String time;
  final String title;

  DataModel(this.author, this.images, this.inshortsLink, this.readMore, this.time, this.title);

  factory DataModel.fromJson(Map<String,dynamic> map) => _$DataModelFromJson(map);

  Map<String,dynamic> toJson() => _$DataModelToJson(this);

}