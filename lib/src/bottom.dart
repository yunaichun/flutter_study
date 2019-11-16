import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import './provide/bottom.dart';

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

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> with AutomaticKeepAliveClientMixin{
  /* 使用混入 with 的条件：
    1、使用的页面必须是StatefulWidget,如果是StatelessWidget是没办法办法使用的。
    2、其实只有两个前置组件才能保持页面状态：TabBarView 和 IndexedStack。
    3、重写wantKeepAlive方法，如果不重写也是实现不了的。 
  */
  @override
  bool get wantKeepAlive => true;
  
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
  final List<Widget> body = [
    Home(),
    Category(),
    Cart(),
    Member()
  ];

  @override
  Widget build(BuildContext context) {
    return Provide<BottomIndexProvide>(
      builder: (context, child, val) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            // 底部切换效果：fixed 固定、shifting 切换动画
            type: BottomNavigationBarType.fixed,
            // 当前 tab 索引
            currentIndex: val.currentIndex,
            // tab 条目
            items: bottomTabs,
            onTap: (index) {
              val.changeIndex(index);
              // Provide.value<BottomIndexProvide>(context).changeIndex(index);
            },
          ),
          // body: body[currentIndex],
          body: IndexedStack(
            index: val.currentIndex,
            children: body
          ),
        );
      }
    );
  }
}
