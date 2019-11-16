import 'package:flutter/material.dart';

/* 组件 */
import './top.dart';
import './order.dart';

class Member extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
      ),
      body: ListView(
        children: <Widget>[
          TopWidget(),
          OrderWidget()
        ],
      )
    );
  }
}
