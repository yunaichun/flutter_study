import 'package:dio/dio.dart';
import 'dart:async';
// import 'dart:io';

// 封装 POST 请求【 formData 可选参数】
Future post(url, { formData }) async { 
 try {
    print('post请求：开始获取数据。请求地址：$url。请求参数：$formData');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType= Headers.formUrlEncodedContentType;

    if (formData == null) {
      response = await dio.post(url);
    } else {
      // response = await dio.post("/test", data: {"id": 12, "name": "wendu"});
      response = await dio.post(url, data: formData);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口异常');
    }
 } catch (e) {
   print('ERROR: ========> $e');
 }
}

// 封装 POST 请求【 queryData 可选参数】
Future get(url, { queryData }) async { 
 try {
    print('get请求：开始获取数据。请求地址：$url。请求参数：$queryData');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType= Headers.formUrlEncodedContentType;

    if (queryData == null) {
      response = await dio.get(url);
    } else {
      // response = await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
      response = await dio.get(url, queryParameters: queryData );
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口异常');
    }
 } catch (e) {
   print('ERROR: ========> $e');
 }
}