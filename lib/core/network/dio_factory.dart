import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/componant/constant.dart';

class DioHelper {
  static Dio? dio;
  static Dio? dioregister;
  static Dio? dioOrder;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://run.mocky.io',
      receiveDataWhenStatusError: true,
    ));
    dioOrder = Dio(BaseOptions(
      baseUrl: 'https://run.mocky.io',
      receiveDataWhenStatusError: true,
    ));

    dioregister = Dio(BaseOptions(
      baseUrl: 'https://run.mocky.io/v3/c92f3272-50e4-404d-b2ba-0eb8425e7cd7',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> Getdetails() async {
    dio!.options.headers = {
      "Accept": "json",
      "Content-Type": "application/json",
    };
    return await dio!
        .get("https://run.mocky.io/v3/1d162909-67ec-450a-9ce5-7e1cf4ec4aef");
  }

  static Future<Response> GetOrder() async {
    dioOrder!.options.headers = {
      "Accept": "json",
      "Content-Type": "application/json",
    };
    return await dioOrder!
        .get("https://run.mocky.io/v3/1d162909-67ec-450a-9ce5-7e1cf4ec4aef");
  }

  static Future<Response> postRegisterData({
    required String? url,
    required Map<String, dynamic>? data,
    String? lang = 'ar',
  }) async {
    dioregister!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return await dioregister!
        .get('https://run.mocky.io/v3/c92f3272-50e4-404d-b2ba-0eb8425e7cd7');
  }
}
