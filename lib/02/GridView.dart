import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
        ),
        body: Center(
          child: Container(
            // 这种写法更直观
            child: GridView(
              // 一般使用 Count，还有 Extend，可以根据内容扩展
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // 网格间的空当，相当于每个网格之间的间距【左右-横轴】
                crossAxisSpacing: 2.0,
                // 网格的列数，相当于一行放置的网格数量
                crossAxisCount: 3,
                // 每个网格的宽高比
                childAspectRatio: 0.7,
                // 网格主轴的间距【上下-纵轴】
                mainAxisSpacing: 2.0,
              ),
              // GridView 子组件是 children
              children: <Widget>[
                new Image.network(
                  'http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg',
                  fit: BoxFit.cover,
                ),
                new Image.network(
                  'http://img5.mtime.cn/mt/2018/10/10/112514.30587089_180X260X4.jpg',
                  fit: BoxFit.cover,
                ),
                new Image.network(
                  'http://img5.mtime.cn/mt/2018/11/13/093605.61422332_180X260X4.jpg',
                  fit: BoxFit.cover,
                ),
                new Image.network(
                  'http://img5.mtime.cn/mt/2018/11/07/092515.55805319_180X260X4.jpg',
                  fit: BoxFit.cover,
                ),
                new Image.network(
                  'http://img5.mtime.cn/mt/2018/11/21/090246.16772408_135X190X4.jpg',
                  fit: BoxFit.cover,
                ),
                new Image.network(
                  'http://img5.mtime.cn/mt/2018/11/17/162028.94879602_135X190X4.jpg',
                  fit: BoxFit.cover,
                ),
                new Image.network(
                  'http://img5.mtime.cn/mt/2018/11/19/165350.52237320_135X190X4.jpg',
                  fit: BoxFit.cover,
                ),
                new Image.network(
                  'http://img5.mtime.cn/mt/2018/11/16/115256.24365160_180X260X4.jpg',
                  fit: BoxFit.cover,
                ),
                new Image.network(
                  'http://img5.mtime.cn/mt/2018/11/20/141608.71613590_135X190X4.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp2 extends StatelessWidget{
  @override
  Widget build(BuildContext context ){
      return MaterialApp(
        title: 'ListView widget',
        home: Scaffold(
          body: Center(
            child: Container(
              // 网格布局最基本用法[官方不太推荐这种写法了]
              child: GridView.count(
                // 表示内边距
                padding:const EdgeInsets.all(20.0),
                // 网格间的空当，相当于每个网格之间的间距【左右】
                crossAxisSpacing: 10.0,
                // 网格的列数，相当于一行放置的网格数量
                crossAxisCount: 3,
                // GridView 子组件是 children
                children: <Widget>[
                  const Text('I am Yunaichun'),
                  const Text('I love Web'),
                  const Text('github.com'),
                  const Text('我喜欢打篮球'),
                  const Text('我喜欢变成'),
                  const Text('我喜欢听音乐')
                ],
              ),
            ),
          ),
        ),
      );
  }
}
