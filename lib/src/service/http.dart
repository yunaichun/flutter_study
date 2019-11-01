import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

// 封装 http 请求【 formData 可选参数】
Future request(url, { formData }) async { 
 try {
    print('首页：开始获取数据');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("'application/x-www-form-urlencoded") as String;
    if (formData == null) {
      response = await dio.post(url);
    } else {
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
