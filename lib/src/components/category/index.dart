import 'package:flutter/material.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/category.dart';

/* 数据格式 */
import '../../types/category.type.dart';
/* 数据请求 */
import '../../service/category.dart';

/* 左侧一级导航 */
import './leftnav.dart';
import './rightnav.dart';
import './goods_list.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<CategoryData> categoryList = [];

  @override
  void initState() {
    super.initState();
    _getCategoryDEV();
  }

  // 获取分类数据
  _getCategoryDEV() {
    getCategoryDEV().then((res) { 
      setState(() {
        // 这里不用 json.decode , 不然会报错, 因为定义的字段不含有 dynamic 类型
        CategoryResponse response = new CategoryResponse.fromJson(res);
        categoryList = response.data;
        Provide.value<CategoryProvider>(context).setCategoryList(categoryList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类页'),
      ),
      body: _body()
    );
  }

  Widget _body() {
    if (categoryList.length != 0) {
      return Row(
        children: <Widget>[
          /* 传入一级分类列表，index 在内部控制 */
          LeftnavWidget(list: categoryList),
          Column(
            children: <Widget>[
              Provide<CategoryProvider>(
                builder: (context, child, category) {
                  /* 每个二级分类前都加入 "全部" */
                  List<SubCategoryData> list = [];
                  SubCategoryData all = new SubCategoryData(
                    mallCategoryId: categoryList[category.categoryIndex].mallCategoryId,
                    mallSubId: '',
                    mallSubName: '全部',
                    comments: 'null',
                  );
                  list = [all];
                  list.addAll(categoryList[category.categoryIndex].bxMallSubDto);
                  /* 传入二级分类列表，index 在内部控制 */
                  return RightnavWidget(
                    list: list,
                  );
                },
              ),
              /* 什么也不传入，内部通过 provide 状态控制 */
              GoodsWidget()
            ],
          )
        ],
      );
    } else {
      return Text('加载中...');
    }
  }
}
