import 'package:flutter/material.dart';
import './pages/DynamicCom.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FloatingActionButton',
      home: FloatingActionButtonWidget(),
    );
  }
}

// 自定义组件
class FloatingActionButtonWidget extends StatefulWidget {
  @override
  _FloatingActionButtonWidgetState createState() => _FloatingActionButtonWidgetState();
}

// 含有状态的组件
class _FloatingActionButtonWidgetState extends State<FloatingActionButtonWidget> {
  // 定义动态变量
  int _currentIndex = 0;

  // 定义组件数组
  List<Widget> list = List();
  // 重写状态
  @override
  void initState() {
    // 可写可不写
    super.initState();
    list
      ..add(DynamicCom('Home'))
      ..add(DynamicCom('Pages'));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButton'),
      ),
      body: list[_currentIndex],
      // 可交互浮动的按钮
      floatingActionButton: FloatingActionButton(
        // 点击事件
        onPressed: () {
          // 路由跳转：等价于 Navigator.push(context, MaterialPageRoute)
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) {
              return DynamicCom('New Page');
            }
          ));
        },
        // 长按的时候 提示文字
        tooltip: 'FloatingActionButton',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      // floatingActionButton 融合到 bottomNavigationBar 的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // BottomAppBar 工具栏更灵活
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        // 设置底栏的形状，一般使用这个都是为了和 floatingActionButton 融合
        // 所以使用的值都是 CircularNotchedRectangle(), 有缺口的圆形矩形
        shape: CircularNotchedRectangle(),
        // 可以放任何的布局容器
        child: Row(
          // 主轴大小
          mainAxisSize: MainAxisSize.max,
          // 主轴对齐方式
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              // 此处没有 index 参数传递
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.pages),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
