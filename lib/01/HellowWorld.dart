import 'package:flutter/material.dart';

// 申明类
class MyApp extends StatelessWidget {
	// 重写 build 方法
  @override
  Widget build(BuildContext context) {
    // 返回一个 Material 风格的组件
    return MaterialApp(
      title: 'Helow world',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Helow world'),
        ),
        body: Center(
          child: Text('Helow world'),
        ),
      ),
    );
  }
}
