import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(80),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          _shopIcon(),
          _addCartBtn(),
          _buyBtn()
        ],
      ),
    );
  }

  // 购物车图标
  Widget _shopIcon() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(110) ,
        alignment: Alignment.center,
        child: Icon(
          Icons.shopping_cart,
          size: 35,
          color: Colors.red,
        ), 
      ) ,
    );
  }

  // 加入购物车
  Widget _addCartBtn() {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(320),
        height: ScreenUtil().setHeight(80),
        color: Colors.green,
        child: Text(
          '加入购物车',
          style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(28)),
        ),
      ) ,
    );
  }

  Widget _buyBtn() {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(320),
        height: ScreenUtil().setHeight(80),
        color: Colors.red,
        child: Text(
          '马上购买',
          style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(28)),
        ),
      ) ,
    );
  }
}
