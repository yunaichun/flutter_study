import 'package:flutter/material.dart';
import './pages/KeepAlive.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBarwidget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabBarwidget()
    );
  }
}

// 有状态组件
class TabBarwidget extends StatefulWidget {
  @override
  _TabBarwidgetState createState() => _TabBarwidgetState();
}

/*
with 是 dart 的关键字，意思是混入的意思，
就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类，避免多重继承导致的问题。

SingleTickerProviderStateMixin 主要是我们初始化 TabController 时，
需要用到vsync ，垂直属性，然后传递 this
*/
class _TabBarwidgetState extends State<TabBarwidget>  with SingleTickerProviderStateMixin {
  // 需要重写 TabController
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }
  //重写被释放的方法，只释放 TabController
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarwidget'),
        // 顶部的 tab 切换
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          KeepAliveWidget(),
          KeepAliveWidget(),
          KeepAliveWidget(),
        ],
      ),
    );
  }
}
