import 'package:flutter/material.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/cart.dart';

/* 商品列表项 */
import './list.dart';

class Cart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: CartList(),
            );
          } else {
            return Text('正在加载');
          }
        },
      )
    );
  }

  /* 注意：
    1、Future封装成方法的时候，必须要有 return
    2、直接在组件中调用请求则不需要考虑
  */
  Future<String> _getCartInfo(BuildContext context) async{
    await Provide.value<CartProvider>(context).getCartInfo();
    return '加载完成';
  }
}
