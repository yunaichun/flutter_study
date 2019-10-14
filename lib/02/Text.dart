import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text'),
        ),
        body: Center(
          child: Text(
            'Text',
            // 对齐方式
            textAlign: TextAlign.left,
            // 超出省略号 + 最多一行
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            // 文本样式
            style: TextStyle(
              // 字体大写
              fontSize: 25.0,
              // 颜色
              color: Color.fromARGB(255, 255, 150, 150),
              // 下划线颜色 + 实线
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
