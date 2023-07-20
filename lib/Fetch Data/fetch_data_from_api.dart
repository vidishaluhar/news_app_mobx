///Fetched data from Api using Retrofit

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app_mobx/Fetch%20Data/retry_interceptor.dart';
import 'package:news_app_mobx/Model/news_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'fetch_data_from_api.g.dart';

@RestApi(baseUrl: "https://inshorts-news.vercel.app")
abstract class DataModelApi {
  factory DataModelApi(Dio dio, {String? baseUrl}) {
    Connectivity connectivity = Connectivity();
    /*StreamSubscription connectivitySubscription;
    Completer completer=Completer();*/

    dio.options = BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        contentType: 'application/json');

    /*dio.interceptors *//*..add(LogInterceptor())*//*
      ..add(ConnectivityRequestRetry(dio: dio, connectivity: connectivity));*/

    /*dynamic requestInterceptor(RequestOptions options) {
      connectivitySubscription = connectivity.onConnectivityChanged.listen(
        (ConnectivityResult connectivityResult) {
          if (connectivityResult == ConnectivityResult.mobile ||
              connectivityResult == ConnectivityResult.wifi) {
           completer.complete(options);
          }
        },
      );
    }*/

    /*dynamic errorInterceptor(DioException dioError) {
      debugPrint("error ${dioError.error}");
      debugPrint("response ${dioError.response}");
      debugPrint("type ${dioError.type}");
      debugPrint("requestOptions ${dioError.requestOptions}");
      debugPrint("message ${dioError.message}");
    }*/

    /*dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) =>
            requestInterceptor(options),
        onError: (DioException dioError, handler) =>
            errorInterceptor(dioError)));*/

    return _DataModelApi(
      dio,
      baseUrl: baseUrl,
    );
  }

  @GET('/{category_path}')
  Future<NewsModel> getDataFromApi(@Path('category_path') String categoryPath);
}
