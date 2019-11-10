import 'package:flutter/material.dart';

/* 静态化的路由 */
import '../routers/application.dart';


class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () {
            Application.router.navigateTo(context, '/detail?id=123&id=22&name=bb');
          },
          child: Text('跳转到详情页'),
        )
      ),
    );
  }
}
