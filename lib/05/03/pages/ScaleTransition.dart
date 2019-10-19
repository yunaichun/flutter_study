import 'package:flutter/material.dart';

// 继承默认的 PageRouteBuilder 构造方法
class CustomRouteScaleTransition extends PageRouteBuilder {
  final Widget widget;

  // 重写构造方法
  CustomRouteScaleTransition(this.widget)
    :super(
      // 过度时间
      transitionDuration: Duration(seconds: 1),
      // 页面构造器[不需要重写]
      pageBuilder: (
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
      ){
        return widget;
      },
      // 过渡函数构造器[需要重写]
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2,
        // 传递的子文件
        Widget child
      ) {
        // 缩放 动画效果
        return ScaleTransition(
          // 从无到有
          scale: Tween(begin: 0.0, end: 1.0)
            .animate(
              CurvedAnimation(
                // 父级动画[默认就是 animation1，不传也可以的]
                parent: animation1,
                curve: Curves.fastOutSlowIn,
              ) 
            ),
          child: child,
        );
      },
    );
}
