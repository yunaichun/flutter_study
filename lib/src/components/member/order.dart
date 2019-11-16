import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: ScreenUtil().setWidth(710),
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _orderTitle(),
          _orderTypeList()
        ],
      ),
    );
  }

  // 我的订单顶部
  Widget _orderTitle(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1,color:Colors.black12)
        )
      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text('我的订单'),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  // 订单列表
  Widget _orderTypeList(){
    return Container(
      width: ScreenUtil().setWidth(710),
      height: ScreenUtil().setHeight(150),
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          _orderTypeItem(Icons.party_mode, '待付款'),
          _orderTypeItem(Icons.query_builder, '待发货'),
          _orderTypeItem(Icons.directions_car, '待收货'),
          _orderTypeItem(Icons.content_paste, '待评价')
        ],
      ),
    );
  }

  Widget _orderTypeItem(icon, String text) {
    return Container(
        width: ScreenUtil().setWidth(165),
        child: Column(
          children: <Widget>[
            Icon(icon, size: 30),
            Text(text),
          ],
        ),
      );
  }

}
