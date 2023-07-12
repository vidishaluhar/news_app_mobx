// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      category: json['category'] as String?,
      countArticles: json['countArticles'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'category': instance.category,
      'countArticles': instance.countArticles,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      author: json['author'] as String?,
      decription: json['decription'] as String?,
      images: json['images'] as String?,
      inshortsLink: json['inshortsLink'] as String?,
      readMore: json['readMore'] as String?,
      time: json['time'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'author': instance.author,
      'decription': instance.decription,
      'images': instance.images,
      'inshortsLink': instance.inshortsLink,
      'readMore': instance.readMore,
      'time': instance.time,
      'title': instance.title,
    };
