
import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';


///Model class for News Articles
@JsonSerializable()
class NewsModel{
  String? category;
  int? countArticles;
  List<Data>? data;

  NewsModel({this.category, this.countArticles, this.data});

  factory NewsModel.fromJson(Map<String,dynamic> map) => _$NewsModelFromJson(map);

  Map<String,dynamic> toJson() => _$NewsModelToJson(this);

}

///Model class for Article details
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
