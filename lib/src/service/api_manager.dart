import 'dart:collection';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:alice/alice.dart';
import 'package:mao_trailer_flutter/src/common/styles/colors.dart';
import 'package:mao_trailer_flutter/src/common/utils/constant.dart';
import 'dart:convert';
import 'package:rxdart/subjects.dart';

class APIManager {
  final bool showCurl = true;
  BuildContext context;
  PublishSubject<bool> logOutSubject;

  APIManager(this.context);

  static APIManager _apiManager;

  static initAPIManager(BuildContext context){
    _apiManager = APIManager(context);
  }

  static Alice alice = Alice(showNotification: true, darkTheme: true);

  static APIManager getAPI() => _apiManager;

  static Future<Dio> getManager({bool showAlert = true}) async {
    return _apiManager._manager(showAlert:showAlert);
  }

  Future<Dio> _manager({bool showAlert = true}) async {
    BaseOptions option = await getDioOptions();
    Dio dio = Dio(option);

    dio.interceptors.add(alice.getDioInterceptor());
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options){
          /// Do something before request is sent
          String curl = "curl -k -X ${options.method} --dump-header -";

          for (String key in options.headers.keys) {
            String header = " -H \"$key: ${options.headers[key]}\"";
            curl = curl + header;
          }

          dynamic data = options.data;
          try {
            String encoding = json.encode(data);
            if (encoding != null) {
              curl = curl + " -d \"$encoding\"";
            }
          } catch (error) {
            if (showCurl) {
              if(data is String){
                print("Param:" + data);
              }
            }
          }

          if (options.path.contains("http")) {
            curl = curl + " ${options.path}";
          } else {
            curl = curl + " ${options.baseUrl}${options.path}";
          }

          if (showCurl) {
            print(curl);
          }

          return options; ///continue
        },
        onResponse:(Response response) {
          /// Do something with response data
          return response; // continue
        },
        onError: (DioError e) {
          /// Do something with response error
          /// Do something with response error
          Response response = e.response;

          print("object error : ${e.type.toString()}");
          if(e.response != null){
            if (e.response.data is Map == false) {
              e.error = "Not in JSON Format";
              if (showAlert) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(e.message),
                  duration: Duration(seconds: 4),
                  backgroundColor: AppColors.primaryColorDark.withOpacity(0.7),
                ));
              }
            }else if (context != null) {
              if (response.statusCode == 401) {
                e.error = "Access Token Expired";
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Session ended"),
                  duration: Duration(seconds: 4),
                  backgroundColor: AppColors.primaryColorDark.withOpacity(0.7),
                ));
              } else if (response.data != null) {
                String message = response.data["message"];
                e.error = message != null ? message : "";
                if (showAlert) {
                  print("response : $response");
                }
              }
            }
          }else{
            if(e.type.toString() == "DioErrorType.CONNECT_TIMEOUT" || e.type.toString() == "DioErrorType.SEND_TIMEOUT"
                || e.type.toString() == "DioErrorType.RECEIVE_TIMEOUT"){
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(e.message),
                duration: Duration(seconds: 4),
                backgroundColor: AppColors.primaryColorDark.withOpacity(0.7),
              ));
            }else if(e.type.toString() == "DioErrorType.DEFAULT"){
              var message = "";
              if(e.error.toString().substring(0, 34) == "SocketException: Connection failed"){
                message = "You are offline";
              }else if(e.error.toString().substring(0, 46) == "SocketException: OS Error: Connection timed out"){
                message = "Connection timed out";
              }
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Row(
                  children: [
                    Icon(Icons.signal_cellular_connected_no_internet_4_bar),
                    SizedBox(width: 10,),
                    Text(message)
                  ],
                ),
                duration: Duration(seconds: 4),
                backgroundColor: AppColors.primaryColorDark.withOpacity(0.7),
              ));
            }
          }
          return e; ///continue
        }));

    return dio;

  }

  Future<BaseOptions> getDioOptions() async {
    Map<String, String> headers = new HashMap();
    headers['Content-Type'] = 'application/json';
    headers['x-api-key'] = '';
    BaseOptions option = BaseOptions();
    option.baseUrl = Constant.baseUrl();
    option.connectTimeout = 180000; //5s
    option.receiveTimeout= 60000;
    return option;
  }
}
