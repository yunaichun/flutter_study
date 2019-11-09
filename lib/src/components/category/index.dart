import 'package:flutter/material.dart';
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
      print(res);
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

