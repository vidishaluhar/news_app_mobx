// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      json['author'] as String,
      json['images'] as String,
      json['inshorts-link'] as String,
      json['read-more'] as String,
      json['time'] as String,
      json['title'] as String,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'author': instance.author,
      'images': instance.images,
      'inshorts-link': instance.inshortsLink,
      'read-more': instance.readMore,
      'time': instance.time,
      'title': instance.title,
    };
