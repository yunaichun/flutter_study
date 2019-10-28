import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Column'),
        ),
        body: Center(
          child: Container(
            // Column 子组件是 children
            child: Column(
              // 副轴：指的是主轴垂直方向【Column 布局横轴就是水平方向】
              crossAxisAlignment: CrossAxisAlignment.start,
              // 主轴对齐方式【Column 布局主轴就是竖直方向】
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('I am Yunaichun'),
                // Expanded 代表此区域会被充满
                Expanded(
                  child: Text('my website is github.com'),
                ),
                Text('I love coding'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}