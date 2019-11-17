import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/cart.dart';

/* 数据格式 */
import 'package:flutter_study/src/types/cart.type.dart';

class CartList extends StatelessWidget {

  Widget build(BuildContext context) {
    // 路由切换了，这里必须要再次初始化一次
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Provide<CartProvider>(
      builder: (context, child, val) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: val.cartList.length,
          itemBuilder: (context, index) {
            return _cartItem(context, val.cartList[index]);
          }
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
          _cartPrice(context, item)
        ],
      )
    );
  }

  // 多选按钮
  Widget _cartCheckBtn(BuildContext context, CartItem item){
    return Container(
      child: Checkbox(
        value: true,
        activeColor: Colors.pink,
        onChanged: (bool val){},
      ),
    );
  }

  // 商品图片 
  Widget _cartImage(BuildContext context, CartItem item){
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12)
      ),
      child: Image.network(item.images),
    );
  }

  // 商品名称
  Widget _cartGoodsName(BuildContext context, CartItem item){
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text(item.goodsName)
        ],
      ),
    );
  }

  // 商品价格
  Widget _cartPrice(BuildContext context, CartItem item){
    return Container(
      width: ScreenUtil().setWidth(150),
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
              onTap: (){},
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
