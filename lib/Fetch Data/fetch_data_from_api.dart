///Fetched data from Api using Retrofit

import 'package:news_app_mobx/Model/news_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'fetch_data_from_api.g.dart';


@RestApi(baseUrl: "https://inshorts-news.vercel.app")
abstract class DataModelApi
{
    factory DataModelApi(Dio dio,{String? baseUrl})
    {
        dio.options=BaseOptions(
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
            contentType: 'application/json'
        );
        return _DataModelApi(dio,baseUrl: baseUrl,);
    }


    @GET('/{category_path}')
    Future<NewsModel> getDataFromApi(@Path('category_path') String categoryPath);
}
