import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
/* 引入页面四个部分 */
import './components/home/index.dart';
import './components/category/index.dart';
import './components/cart/index.dart';
import './components/member/index.dart';


// 底部导航栏
class BottomNavigationBarWidget extends StatefulWidget {
  BottomNavigationBarWidget({Key key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  // 当前 tab 索引
  int currentIndex = 0;
  
  // 底部 tab 条目
  List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心')
    )
  ];

  // 定义页面四个部分
  final body = [
    Home(),
    Category(),
    Cart(),
    Member()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        // 底部切换效果：fixed 固定、shifting 切换动画
        type: BottomNavigationBarType.fixed,
        // 当前 tab 索引
        currentIndex: currentIndex,
        // tab 条目
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: body[currentIndex],
    );
  }
}
