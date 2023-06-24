import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:news_app_mobx/Model/data_model.dart';
import 'package:http/http.dart' as http;

class DataModelApi
{
  Future<List<DataModel>> getDataFromApi() async
  {
    final url=Uri.parse("https://inshorts-news.vercel.app/all");
    try
        {
            final response=await http.get(url);
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
}