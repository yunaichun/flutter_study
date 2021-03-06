import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView.builder',
      // 传递的参数
      home: MainPage(items: List<String>.generate(1000, (i) => 'Items $i')),
    );
  }
}

class  MainPage extends StatelessWidget {
  // 传递参数
  final List<String> items;
  MainPage({Key key, @required this.items}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView.builder'),
      ),
      body: Center(
          // ListView 的子组件用 children
          child: Container(
            // 动态穿件列表
            child: ListView.builder(
              itemCount: items.length,
              // 列表每个条目构建函数
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${items[index]}'),
                );
              },
            ),
          ),
        ),
    );
  }
}
