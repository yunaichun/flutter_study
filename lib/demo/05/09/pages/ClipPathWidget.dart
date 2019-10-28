import 'package:flutter/material.dart';

class ClipPathWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 列布局
      body:Column(
        children: <Widget>[
          // 路径剪裁
          ClipPath(
            // 剪裁路径
            clipper: BottomClipper2(),
            // 曲线内部的子元素
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200.0,
            ),
          )
        ],
      )
    );
  }
}

// 单个贝塞尔曲线
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    // size.height 指的是子元素的高度
    path.lineTo(0, size.height - 30);
    // 第一个控制点[中心点]
    var firstControlPoint = Offset(size.width/2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 30);
    // 调用贝塞尔曲线方法
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy
    );
    // 贝塞尔曲线结束点
    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }
  // 默认，必须写
  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

// 两个贝塞尔曲线
class BottomClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    // size.height 指的是子元素的高度
    path.lineTo(0, size.height - 30);

    // 第一个控制点[中心点]
    var firstControlPoint = Offset(size.width/4, size.height);
    var firstEndPoint = Offset(size.width/2, size.height - 30);
    // 调用贝塞尔曲线方法
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy
    );

    // 第二个控制点[中心点]
    var secondControlPoint = Offset(size.width/4*3, size.height - 60);
    var secondEndPoint = Offset(size.width, size.height - 30);
    // 调用贝塞尔曲线方法
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy
    );

    // 贝塞尔曲线结束点
    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }
  // 默认，必须写
  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
