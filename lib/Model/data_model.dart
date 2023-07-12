// import 'package:json_annotation/json_annotation.dart';
// part 'data_model.g.dart';
//
// @JsonSerializable()
// class DataModel
// {
//   final String author;
//   final String images;
//   final String decription;
//
//   @JsonKey(name: 'inshorts-link')
//   final String inshortsLink;
//
//   @JsonKey(name: 'read-more')
//   final String readMore;
//   final DateTime time;
//   final String title;
//
//   DataModel(this.author, this.images, this.inshortsLink, this.readMore, this.time, this.title, this.decription);
//
//   factory DataModel.fromJson(Map<String,dynamic> map) => _$DataModelFromJson(map);
//
//   Map<String,dynamic> toJson() => _$DataModelToJson(this);
//
// }

import 'package:json_annotation/json_annotation.dart';
part 'data_model.g.dart';
@JsonSerializable()
class NewsModel {
  String? category;
  int? countArticles;
  List<Data>? data;

  NewsModel({this.category, this.countArticles, this.data});

  factory NewsModel.fromJson(Map<String,dynamic> map) => _$NewsModelFromJson(map);

  Map<String,dynamic> toJson() => _$NewsModelToJson(this);

}

@JsonSerializable()
class Data {
  String? author;
  String? decription;
  String? images;
  String? inshortsLink;
  String? readMore;
  String? time;
  String? title;

  Data(
      {this.author,
        this.decription,
        this.images,
        this.inshortsLink,
        this.readMore,
        this.time,
        this.title});

  factory Data.fromJson(Map<String,dynamic> map) => _$DataFromJson(map);

  Map<String,dynamic> toJson() => _$DataToJson(this);

}
