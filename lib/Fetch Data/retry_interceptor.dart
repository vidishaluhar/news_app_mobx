import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// class RetryInterceptor extends Interceptor {
//
//   Connectivity connectivity = Connectivity();
//
//
//   Future<RequestOptions> requestInterceptor(RequestOptions options) {
//     StreamSubscription? connectivitySubscription;
//     Completer completer = Completer<Response>();
//
//     connectivitySubscription = connectivity.onConnectivityChanged.listen(
//       (connectivityResult) {
//         if (connectivityResult != ConnectivityResult.none) {
//           if (connectivitySubscription != null) connectivitySubscription.cancel();
//           Dio dio = Dio();
//           completer.complete(dio.request(options.path));
//         }
//       },
//     );
//     return completer.future;
//   }
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) async {
//     if (err.type is SocketException) {
//       handler.resolve(await requestInterceptor(err.requestOptions));
//     } else {
//       debugPrint("__________IN SOCKET EXCEPTION__________");
//       debugPrint("error ${err.error}");
//       debugPrint("response ${err.response}");
//       debugPrint("type ${err.type}");
//       debugPrint("requestOptions ${err.requestOptions}");
//       debugPrint("message ${err.message}");
//       debugPrint("__________IN SOCKET EXCEPTION__________");
//       handler.next(err);
//     }
//     handler.next(err);
//   }
// }
class ConnectivityRequestRetry extends Interceptor{
  final Dio dio;
  final Connectivity connectivity;

  ConnectivityRequestRetry({required this.dio, required this.connectivity});

  Future<Response> shouldRequestRetry(RequestOptions requestOptions) async {
    StreamSubscription? streamSubscription;

    final responseCompleter = Completer<Response>();
    streamSubscription = connectivity.onConnectivityChanged.listen(
          (event) {
        if (event != ConnectivityResult.none) {
          if (streamSubscription != null) {
            streamSubscription.cancel();
          }
          responseCompleter.complete(
            dio.request(
              requestOptions.path,
              cancelToken: requestOptions.cancelToken,
              data: requestOptions.data,
              onReceiveProgress: requestOptions.onReceiveProgress,
              onSendProgress: requestOptions.onSendProgress,
              queryParameters: requestOptions.queryParameters,
              options: Options(
                method: requestOptions.method,
                sendTimeout: requestOptions.sendTimeout,
                receiveTimeout: requestOptions.receiveTimeout,
                extra: requestOptions.extra,
                headers: requestOptions.headers,
                contentType: requestOptions.contentType,
                responseType: requestOptions.responseType,
                validateStatus: requestOptions.validateStatus,
                receiveDataWhenStatusError:
                requestOptions.receiveDataWhenStatusError,
                followRedirects: requestOptions.followRedirects,
                maxRedirects: requestOptions.maxRedirects,
                requestEncoder: requestOptions.requestEncoder,
                responseDecoder: requestOptions.responseDecoder,
                listFormat: requestOptions.listFormat,
              ),
            ),
          );
        }
      },
    );

    return responseCompleter.future;
  }
}
/*
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class ConnectivityInterceptor extends Interceptor {
  final Dio dio;
  final StreamController<bool> _connectivityStreamController = StreamController<bool>();

  ConnectivityInterceptor(this.dio) {
    _initConnectivityListener();
  }

  Future<void> _initConnectivityListener() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _connectivityStreamController.add(result != ConnectivityResult.none);
    });
  }

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (await _isConnected()) {
      return handler.next(options);
    } else {
      return handler.reject(DioError(
        error: "Please check your network connectivity.",
        requestOptions: options,
      ));
    }
  }

  Future<bool> _isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  Stream<bool> get connectivityStream => _connectivityStreamController.stream;
}
*/
