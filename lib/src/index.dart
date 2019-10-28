import 'package:flutter/material.dart';
import './bottom.dart';

// 入口文件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 添加 container 是为了扩展
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        // 不显示右上角的 debug 商标
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: BottomNavigationBarWidget(),
      ),
    );
  }
}
