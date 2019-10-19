import 'package:flutter/material.dart';
import './FadeTransition.dart';
import './ScaleTransition.dart';
import './RotationTransition.dart';
import './SlideTransition.dart';


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 背景色
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('FirstPage', style: TextStyle(fontSize: 36.0),),
        // 默认 4.0，底部与 body 是否完全融合
        elevation: 4.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () {
            // 一、默认路由跳转
            // 等价于 Navigator.push(context, MaterialPageRoute())
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (BuildContext context) {
            //     return SecondPage();
            //   }
            // ));

            // 二、渐隐渐显路由跳转
            // Navigator.of(context).push(CustomRouteFadeTransition(SecondPage()));

            // 三、缩放路由跳转
            // Navigator.of(context).push(CustomRouteScaleTransition(SecondPage()));

            // 四、旋转 + 缩放路由跳转
            // Navigator.of(context).push(CustomRouteRotationTransition(SecondPage()));

            // 五、左右滑动路由跳转
            Navigator.of(context).push(CustomRouteSlideTransition(SecondPage()));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('SecondPage', style: TextStyle(fontSize: 36.0),),
        backgroundColor: Colors.pinkAccent,
        // 字体居中
        leading: Container(),
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () {
            // 等价于 Navigator.push(context, MaterialPageRoute())
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
