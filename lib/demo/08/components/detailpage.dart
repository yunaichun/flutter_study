import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String goodsId;
  DetailPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
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
