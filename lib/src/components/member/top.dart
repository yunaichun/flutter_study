import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 路由切换了，这里必须要再次初始化一次
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(20),
      color: Colors.pinkAccent,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30), 
            child: ClipOval(
              child: Image.asset('images/flutter_icon.png')
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'Flutter',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color:Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}