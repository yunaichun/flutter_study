import 'package:flutter/material.dart';
/* 将 json 对象转换为 dart 对象：json.decode */
import 'dart:convert';
/* 数据格式 */
import '../../types/category.type.dart';
/* 数据请求 */
import '../../service/category.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    super.initState();
    _getCategoryDEV();
  } 

  // 获取分类数据
  _getCategoryDEV() {
    getCategoryDEV().then((res) {
      // 这里不用 json.decode ,会报错
      CategoryResponse response = CategoryResponse.fromJson(res);
      print(response.data);
      setState(() {
        // 这里不用 json.decode ,会报错
        // HomeResponse response = new HomeResponse.fromJson(res);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商城分类页'),
      ),
      body:Center(
        child: Text('商城分类页'),
      )
    );
  }
}

