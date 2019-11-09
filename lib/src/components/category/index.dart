import 'package:flutter/material.dart';

/* 将 json 对象转换为 dart 对象：json.decode */
import 'dart:convert';
/* 数据格式 */
import '../../types/category.type.dart';
/* 数据请求 */
import '../../service/category.dart';

/* 左侧一级导航 */
import './leftnav.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<CategoryData> list = [];

  @override
  void initState() {
    super.initState();
    _getCategoryDEV();
  } 

  // 获取分类数据
  _getCategoryDEV() {
    getCategoryDEV().then((res) { 
      setState(() {
        // 这里不用 json.decode ,会报错
        CategoryResponse response = new CategoryResponse.fromJson(res);
        list = response.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商城分类页'),
      ),
      body: _body()
    );
  }

  Widget _body() {
    print('list.length1');
    print(list.length);
    print('list.length2');
    if (list.length != 0) {
      return Row(
        children: <Widget>[
          LeftnavWidget(list: list),
        ],
      );
    } else {
      return Text('加载中...');
    }
  }
}
