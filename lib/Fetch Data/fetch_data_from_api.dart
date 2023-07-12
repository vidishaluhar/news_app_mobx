import 'package:news_app_mobx/Model/data_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'fetch_data_from_api.g.dart';


@RestApi(baseUrl: "https://inshorts-news.vercel.app")
abstract class DataModelApi
{
    factory DataModelApi(Dio dio,{String? baseUrl})
    {
        dio.options=BaseOptions(
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 5),
            contentType: 'application/json'
        );
        return _DataModelApi(dio,baseUrl: baseUrl);
    }

    @GET('/all')
    Future<NewsModel> getDataFromApi();

}


/*
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:news_app_mobx/Model/data_model.dart';
import 'package:http/http.dart' as http;
    final url=Uri.parse("https://inshorts-news.vercel.app/all");
    try
        {
            final response=await http.get(url);

class DataModelApi
{
  Future<List<DataModel>> getDataFromApi() async
  {
            if(response.statusCode == 200)
              {
                final data=jsonDecode(response.body)['data'] as List;
                return data.map((e) => DataModel.fromJson(e),).toList();
              }
            else
              {
                debugPrint("Failed to fetch data");
                return [];
              }
        }
        catch(e)
        {
          debugPrint("Error while fetching data from Api : $e");
          return[];
        }
  }
}*/
