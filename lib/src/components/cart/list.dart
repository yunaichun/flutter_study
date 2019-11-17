import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/cart.dart';

/* 静态化路由 */
import '../../routers/application.dart';

/* 数据格式 */
import 'package:flutter_study/src/types/cart.type.dart';

/* 商品加减组件 */
import './operate.dart';

class CartListWidget extends StatelessWidget {

  Widget build(BuildContext context) {
    // 路由切换了，这里必须要再次初始化一次
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Provide<CartProvider>(
      builder: (context, child, val) {
        return  Container(
          // 解决 stack 布局的小 bug 没有商品的时候 购买按钮 会在顶部
          height: ScreenUtil().setHeight(2000),
          margin: EdgeInsets.only(bottom: 50.0),
          child: ListView.builder(
          shrinkWrap: true,
          itemCount: val.cartList.length,
            itemBuilder: (context, index) {
              return _cartItem(context, val.cartList[index]);
            }
          )
        );
      },
    );
  }

  // 购物车商品每一项
  Widget _cartItem(BuildContext context, CartItem item){
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      // height: ScreenUtil().setHeight(100),
      // width: ScreenUtil().setWidth(700),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: Row(
        children: <Widget>[
          _cartCheckBtn(context, item),
          _cartImage(context, item),
          _cartGoodsName(context, item),
          _cartPriceAndDelete(context, item)
        ],
      )
    );
  }

  // 多选按钮
  Widget _cartCheckBtn(BuildContext context, CartItem item){
    return Container(
      child: Checkbox(
        value: item.isCheck,
        activeColor: Colors.pink,
        onChanged: (bool val){
          Provide.value<CartProvider>(context).changeGoodsChecked(item.goodsId);
        },
      ),
    );
  }

  // 商品图片 
  Widget _cartImage(BuildContext context, CartItem item){
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, '/detail?id=${item.goodsId}');
      },
      child: Container(
        width: ScreenUtil().setWidth(150),
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black12)
        ),
        child: Image.network(item.images),
      ),
    );
  }

  // 商品名称
  Widget _cartGoodsName(BuildContext context, CartItem item){
    return Container(
      width: ScreenUtil().setWidth(330),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(330),
            alignment: Alignment.centerLeft,
            child: Text(item.goodsName),
          ),
          Container(
            alignment: Alignment.center,
            child: CartOperateWidget(item),
          )
        ],
      ),
    );
  }

  // 商品价格、删除商品
  Widget _cartPriceAndDelete(BuildContext context, CartItem item){
    return Container(
      width: ScreenUtil().setWidth(120),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            child: Text('￥${item.price}')
          ),
          Container(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Provide.value<CartProvider>(context).deleteGoods(item.goodsId);
              },
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

}
