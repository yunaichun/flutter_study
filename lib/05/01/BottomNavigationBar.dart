import 'package:flutter/material.dart';
import './pages/Home.dart';
import './pages/Email.dart';
import './pages/Pages.dart';
import './pages/Airplay.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavigationBar',
      // 主题
      theme: ThemeData.light(),
      home: BottomNavigationBarWidget(),
    );
  }
}

// 自定义组件
class BottomNavigationBarWidget extends StatefulWidget {
  // 通过 createState 创建组件的状态
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

// 含有状态的组件
class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  // 内部静态变量
  final _BottomNavigationBarWidgetColor = Colors.blue;

  // 定义动态变量
  int _currentIndex = 0;

  // 定义组件变量
  List<Widget> list = List();
  // 重写状态
  @override
  void initState() {
    super.initState();
    list
      ..add(Home())
      ..add(Email())
      ..add(Pages())
      ..add(Airplay());
  }
  // 以上写法等价于以下写法
  //List<Widget> list = [Home(), Email(), Pages(), Airplay()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 当前应该显示的组件
      body: list[_currentIndex],
      // 底部导航
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航列表
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationBarWidgetColor,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: _BottomNavigationBarWidgetColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _BottomNavigationBarWidgetColor,
            ),
            title: Text(
              'Email',
              style: TextStyle(
                color: _BottomNavigationBarWidgetColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _BottomNavigationBarWidgetColor,
            ),
            title: Text(
              'Pages',
              style: TextStyle(
                color: _BottomNavigationBarWidgetColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _BottomNavigationBarWidgetColor,
            ),
            title: Text(
              'Airplay',
              style: TextStyle(
                color: _BottomNavigationBarWidgetColor,
              ),
            ),
          ),
        ],
        // 点击事件
        onTap: (int index) {
          //  _currentIndex = index;
          // 因为是动态组件，所以需要通过 setState 修改状态
          setState(() {
            _currentIndex = index;
          });
        },
        // 底部选中高亮 index
        currentIndex: _currentIndex,
        // 底部切换效果：fixed 固定、shifting 切换动画
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
