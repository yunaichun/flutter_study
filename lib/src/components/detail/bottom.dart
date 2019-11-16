import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/goods_detail.dart';
import 'package:flutter_study/src/provide/cart.dart';

import '../../types/goods_detail.type.dart';

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GoodsDetailProvider>(
      builder: (context, child, val) {
        return Container(
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(80),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              _shopIcon(),
              _addCartBtn(context, val.goodsDetail),
              _buyBtn(context)
            ],
          ),
        );
      },
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
  Widget _addCartBtn(context, GoodsDetailData goodsDetail) {
    return InkWell(
      onTap: () async {
        await Provide.value<CartProvider>(context)
        .save(
          goodsDetail.goodInfo.goodsId,
          goodsDetail.goodInfo.goodsName,
          1,
          goodsDetail.goodInfo.presentPrice,
          goodsDetail.goodInfo.image1
        );
      },
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

  Widget _buyBtn(context) {
    return InkWell(
      onTap: () async {
        await Provide.value<CartProvider>(context).remove();
      },
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
