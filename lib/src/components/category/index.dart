import 'package:flutter/material.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/category.dart';

/* 左侧一级导航 */
import './leftnav.dart';
/* 右侧二级导航 */
import './rightnav.dart';
/* 商品列表 */
import './goods_list.dart';

class Category extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类页'),
      ),
      body: _body(context)
    );
  }

  Widget _body(context) {
    return FutureBuilder(
      future: initinalPage(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Row(
            children: <Widget>[
              LeftnavWidget(),
              Column(
                children: <Widget>[
                  RightnavWidget(),
                  GoodsWidget()
                ],
              )
            ],
          );
        } else {
          return Text('加载中...');
        }
      }
    );
  }

  Future initinalPage(context) async {
    await Provide.value<CategoryProvider>(context).initinalPage();
    return '完成加载';
  }
}
