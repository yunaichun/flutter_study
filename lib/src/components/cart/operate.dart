import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/cart.dart';

/* 数据格式 */
import 'package:flutter_study/src/types/cart.type.dart';

class CartOperateWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provide<CartProvider>(
      builder: (context, child, val) {
        return Container(
          width: ScreenUtil().setWidth(165),
          margin: EdgeInsets.only(top: 5.0),
          decoration: BoxDecoration(
            border: Border.all(width: 1 , color: Colors.black12)
          ),
          child: Row(
            children: <Widget>[
              _reduceBtn(context),
              _goodsCount(context),
              _addBtn(context)
            ],
          ),
        );
      }
    );
  }

  //中间数量显示区域
  Widget _goodsCount(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
       child: Text('1'),
    );
  }

  // 减少按钮
  Widget _reduceBtn(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(width: 1, color: Colors.black12)
          )
        ),
        child: Text('-'),
      ),
    );
  }

  // 添加按钮
  Widget _addBtn(BuildContext context){
    return InkWell(
      onTap: (){},
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
         decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 1, color: Colors.black12)
          )
        ),
        child: Text('+'),
      ),
    );
  }

}
