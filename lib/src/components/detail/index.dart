import 'package:flutter/material.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/goods_detail.dart';

/* 数据格式 */
import '../../types/category.type.dart';

class DetailPage extends StatelessWidget {
  final String goodsId;
  DetailPage(this.goodsId);

  void _getBackInfo(BuildContext context) async {
    await Provide.value<GoodsDetailProvider>(context).getGoodsDetailRequest(goodsId);
    print('加载完成............');
  }

  @override
  Widget build(BuildContext context) {
    _getBackInfo(context);
    return MaterialApp(
      title: 'fluro路由 - 详情页',
      home: Scaffold(
        appBar: AppBar(
          title: Text('fluro路由 - 详情页'),
        ),
        body: Center(
          child: Container(
            child: Text('商品ID为：$goodsId')
          )
        ),
      ),
    );
  }
}
