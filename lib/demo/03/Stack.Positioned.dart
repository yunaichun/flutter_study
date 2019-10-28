import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack.Positioned',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack.Positioned'),
        ),
        body: Center(
          child: Container(
            // Stack 布局子组件是 children
            child: Stack(
              children: <Widget>[
                // 圆形头像
                CircleAvatar(
                  // Image.network('https://avatars3.githubusercontent.com/u/15957114?s=460&v=4')
                  backgroundImage: NetworkImage('https://avatars3.githubusercontent.com/u/15957114?s=460&v=4'),
                  radius: 100.0,
                ),
                // 多个组件的效果一般用 Positioned 组件
                Positioned(
                  top: 10.0,
                  left: 10.0,
                  child: Text('Yunaichun'),
                ),
                Positioned(
                  bottom: 10.0,
                  right: 10.0,
                  child: Text('Love Coding'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}