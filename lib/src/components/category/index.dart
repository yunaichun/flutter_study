import 'package:flutter/material.dart';

/* 将 json 对象转换为 dart 对象：json.decode */
import 'dart:convert';
/* 数据格式 */
import '../../types/category.type.dart';
import '../../types/goods.type.dart';
/* 数据请求 */
import '../../service/category.dart';

/* 左侧一级导航 */
import './leftnav.dart';
import './rightnav.dart';
import './goods.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<CategoryData> categoryList = [];
  List<GoodsData> goodsList = [];

  @override
  void initState() {
    super.initState();
    _getCategoryDEV();
    _getMallGoods();
  }

  // 获取分类数据
  _getCategoryDEV() {
    getCategoryDEV().then((res) { 
      setState(() {
        // 这里不用 json.decode , 不然会报错, 因为定义的字段不含有 dynamic 类型
        CategoryResponse response = new CategoryResponse.fromJson(res);
        categoryList = response.data;
      });
    });
  }

  // 获取商品数据
  _getMallGoods() {
    var formData = { 
      'categoryId': '2c9f6c946cd22d7b016cd732f0f6002f',
      'categorySubId': '',
      'page': 1 
    };
    getMallGoods(formData: formData).then((res) {
      setState(() {
        // 这里需要用 json.decode , 不然会报错，因为定义的字段含有 dynamic 类型
        GoodsResponse response = new GoodsResponse.fromJson(json.decode(res));
        goodsList = response.data;
        print(goodsList);
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
    if (categoryList.length != 0) {
      return Row(
        children: <Widget>[
          LeftnavWidget(list: categoryList),
          Column(
            children: <Widget>[
              RightnavWidget(list: categoryList[0].bxMallSubDto),
              goodsList.length != 0 ? GoodsWidget(list: goodsList) : Text('加载中')
            ],
          )
        ],
      );
    } else {
      return Text('加载中...');
    }
  }
}
