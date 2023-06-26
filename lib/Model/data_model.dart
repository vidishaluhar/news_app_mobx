import 'package:json_annotation/json_annotation.dart';
part 'data_model.g.dart';
@JsonSerializable()
class DataModel
{
  final String author;
  final String images;
  final String decription;

  @JsonKey(name: 'inshorts-link')
  final String inshortsLink;

  @JsonKey(name: 'read-more')
  final String readMore;
  final DateTime time;
  final String title;

  DataModel(this.author, this.images, this.inshortsLink, this.readMore, this.time, this.title, this.decription);

  factory DataModel.fromJson(Map<String,dynamic> map) => _$DataModelFromJson(map);

  Map<String,dynamic> toJson() => _$DataModelToJson(this);

}