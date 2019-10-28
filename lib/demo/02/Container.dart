import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container'),
        ),
        body: Center(
          child: Container(
            // 子节点
            child: Text('Container'),
            // 对齐方式
            alignment: Alignment.center,
            // 宽高
            width: 500.0,
            height: 400.0,           
            // 内外边距
            padding:const EdgeInsets.fromLTRB(10.0,30.0,0.0,0.0),
            margin: const EdgeInsets.all(10.0),
            // 颜色 + 渐变(颜色、渐变只能取其中之一) + 边框
            // color: Colors.lightBlue,
            decoration: new BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.lightBlue,Colors.greenAccent,Colors.purple],
              ),
              border: Border.all(
                width: 2.0,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}