import 'package:flutter/material.dart';

/* 数据持久化【https://github.com/flutter/plugins/tree/master/packages/shared_preferences】 */
import 'package:shared_preferences/shared_preferences.dart';

/* 数据格式 */
import 'package:flutter_study/src/types/cart.type.dart';

/* 将 json 对象转换为 dart 对象：json.decode */
import 'dart:convert';

class CartProvider with ChangeNotifier{
  List<CartItem> cartList = [];

  // 从持久化数据中获取 cartList
  getCartInfo() async {
    // 一、获取持久化存储的值
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartString = prefs.getString('cartInfo');
    if (cartString == null) {
      // 初始和移除之后都是 null
      cartList = [];
    } else {
      cartList = (json.decode(cartString.toString()) as List).map((i) => CartItem.fromJson(i)).toList();
    }

    notifyListeners();
  }

  save(goodsId, goodsName, count, price, images) async {
    // 一、获取持久化存储的值
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartString = prefs.getString('cartInfo');
    if (cartString == null) {
      // 初始和移除之后都是 null
      cartList = [];
    } else {
      cartList = (json.decode(cartString.toString()) as List).map((i) => CartItem.fromJson(i)).toList();
    }

    // 二、保存到 Provide
    bool exist = false;
    int index = 0; // forEach 遍历拿不到 index
    cartList.forEach((item) {
      print(item);
      if (item.goodsId == goodsId) {
        cartList[index].count = item.count + 1;
        exist = true;
      }
      index++;
    });
    if (!exist) {
      Map<String, dynamic> newGoods = {
        "goodsId": goodsId,
        "goodsName": goodsName,
        "count": count,
        "price": price,
        "images": images
      };
      cartList.add(new CartItem.fromJson(newGoods));
    }

    // 三、保存到 SharedPreferences
    cartString = json.encode(cartList).toString();
    prefs.setString('cartInfo', cartString);

    notifyListeners();
  }

  remove() async {
    // 清空 SharedPreferences。清空之后就会变成 null
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear(); // 清空全部
    prefs.remove('cartInfo');
    print('清空完成-----------------');

    notifyListeners();
  }

}
