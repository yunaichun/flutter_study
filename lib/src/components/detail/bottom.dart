import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/goods_detail.dart';
import 'package:flutter_study/src/provide/cart.dart';
import 'package:flutter_study/src/provide/bottom.dart';

/* 静态化路由 */
import '../../routers/application.dart';

/* 数据格式 */
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
              Stack(
                children: <Widget>[
                  _shopIcon(context),
                  _shopTotalCount(context)
                ],
              ),
              _addCartBtn(context, val.goodsDetail),
              _buyBtn(context)
            ],
          ),
        );
      },
    );
  }

  // 购物车图标
  Widget _shopIcon(context) {
    return InkWell(
      onTap: () {
        /* 注意：
            有一个奇怪的现象，详情页面顶部返回调用 Navigator.pop(context) 可以返回
            但是，内部组件调用 Navigator.pop(context) 不能正常返回。
            解决方案是为主页面再定义一个路由。
        */
        // Navigator.pop(context);
        Application.router.navigateTo(context, '/');
        Provide.value<BottomIndexProvide>(context).changeIndex(2);
      },
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

  // 购物车总数
  Widget _shopTotalCount(context) {
    return Provide<CartProvider>(
      builder: (context, child, val){
        return  Positioned(
          top: 0,
          right: 10,
          child: Container(
            padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
            decoration: BoxDecoration(
              color: Colors.pink,
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(12.0)
            ),
            child: Text(
              '${val.totalGoodsCount}',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(22)
              ),
            ),
          ),
        );
      },
    );
  }

  // 加入购物车
  Widget _addCartBtn(context, GoodsDetailData goodsDetail) {
    return InkWell(
      onTap: () async {
        await Provide.value<CartProvider>(context)
        .saveGoods(
          goodsId: goodsDetail.goodInfo.goodsId,
          goodsName: goodsDetail.goodInfo.goodsName,
          count: 1,
          price: goodsDetail.goodInfo.presentPrice,
          images: goodsDetail.goodInfo.image1,
          isCheck: true
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

  // 立即购买
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
