import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RetryInterceptor extends Interceptor {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  Completer completer = Completer<Response<dynamic>>();

  Future requestInterceptor(RequestOptions options) {
    connectivitySubscription = connectivity.onConnectivityChanged.listen(
      (ConnectivityResult connectivityResult) {
        if (connectivityResult != ConnectivityResult.none) {
          unawaited(connectivitySubscription?.cancel());
          completer.complete(options);
        }
      },
    );
    return completer.future;
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type is SocketException) {
      handler.resolve(await requestInterceptor(err.requestOptions));
    } else {
      debugPrint("__________IN SOCKET EXCEPTION__________");
      debugPrint("error ${err.error}");
      debugPrint("response ${err.response}");
      debugPrint("type ${err.type}");
      debugPrint("requestOptions ${err.requestOptions}");
      debugPrint("message ${err.message}");
      debugPrint("__________IN SOCKET EXCEPTION__________");
      handler.next(err);
    }
    handler.next(err);
  }

}
