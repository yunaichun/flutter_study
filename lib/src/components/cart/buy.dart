import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/cart.dart';

/* 数据格式 */
import 'package:flutter_study/src/types/cart.type.dart';


class CartBuyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<CartProvider>(
      builder: (context, child, val) {
        return Container(
          margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),
          color: Colors.white,
          width: ScreenUtil().setWidth(750),
          child: Row(
            children: <Widget>[
              _selectAllBtn(context),
              _totalPrice(context, val.totalPrice),
              _bugBtn(context, val.totalGoodsCount)
            ],
          ),
        );
      }
    );
  }

  // 全选按钮
  Widget _selectAllBtn(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5.0),
            child: Checkbox(
              value: true,
              activeColor: Colors.pink,
              onChanged: (bool val){},
            ),
          ),
          Text('全选')
        ],
      ),
    );
  }

  // 合计区域
  Widget _totalPrice(BuildContext context, double totalPrice) {
    return Container(
      width: ScreenUtil().setWidth(430),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              // 合计 title
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(280),
                child: Text(
                  '合计:',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36)
                  )
                ), 
              ),
              // 合计 价格
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(150),
                child: Text(
                  '￥$totalPrice',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                    color: Colors.red,
                  )
                ), 
              )
            ],
          ),
          // 优惠推送
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费，预购免配送费',
              style: TextStyle(
                color: Colors.black38,
                fontSize: ScreenUtil().setSp(22)
              ),
            ),
          )    
        ],
      ),
    );
  }

  // 结算按钮
  Widget _bugBtn(BuildContext context, int totalGoodsCount) {
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
             color: Colors.red,
             borderRadius: BorderRadius.circular(3.0)
          ),
          child: Text(
            '结算($totalGoodsCount)',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ) ,
    );
  }

}
