import 'package:flutter/material.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/cart.dart';

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
          List cartList = Provide.value<CartProvider>(context).cartList;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartList[index].goodsName)
                );
              }
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
