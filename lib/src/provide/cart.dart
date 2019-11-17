import 'package:flutter/material.dart';

/* 数据持久化【https://github.com/flutter/plugins/tree/master/packages/shared_preferences】 */
import 'package:shared_preferences/shared_preferences.dart';

/* 数据格式 */
import 'package:flutter_study/src/types/cart.type.dart';

/* 将 json 对象转换为 dart 对象：json.decode */
import 'dart:convert';

class CartProvider with ChangeNotifier{
  List<CartItem> cartList = [];
  double totalPrice = 0;
  int totalGoodsCount = 0;
  bool isAllChecked = true;

  // 初始化所有数据【优先从持久化数据中获取，否则从 Provider 中获取】
  getGoodsList() async {
    // 一、获取持久化存储的值
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartString = prefs.getString('cartInfo');
    if (cartString == null) {
      // 初始和移除之后都是 null
      cartList = [];
    } else {
      /* 注意：
        1、如果使用 cartList = json.decode(cartString.toString());
           在调用 cartList.add 的时候会报错 'List<dynamic>' is not a subtype of type 'List<CartItem>'
           需要遍历下此数组，每一项都调用下 fromJson 方法
        2、Map<String, dynamic> 对象通过 add 添加至 List<CartItem>
           需要在 types 文件中写 toJson 方法 
        3、根据数组遍历得到的结果最后别忘记 toList() 。如首页导航组件
           navigatorData.map((item) => _gridViewItem(context, item)).toList()
      */
      cartList = (json.decode(cartString.toString()) as List).map((i) => CartItem.fromJson(i)).toList();
      totalPrice = 0;
      totalGoodsCount = 0;
      isAllChecked = true;
      cartList.forEach((item) {
        if(item.isCheck){
          totalPrice += (item.count*item.price);
          totalGoodsCount += item.count;
        } else {
          isAllChecked = false;
        }
      });
    }

    notifyListeners();
  }

  // 添加商品
  saveGoods(goodsId, goodsName, count, price, images, isCheck) async {
    // 一、获取持久化存储的值
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartString = prefs.getString('cartInfo');
    int index = getGoodsIndex(goodsId);

    // 二、保存到 Provide
    if (index == -1) {
      /* 第一种写法；这种写法需要在 types 文件中写 toJson 方法 */
      // Map<String, dynamic> newGoods = {
      //   "goodsId": goodsId,
      //   "goodsName": goodsName,
      //   "count": count,
      //   "price": price,
      //   "images": images
      //   "isCheck": isCheck
      // };
      // cartList.add(new CartItem.fromJson(newGoods));

      /* 第二种写法 */
      CartItem newGoods = new CartItem(
        goodsId: goodsId,
        goodsName: goodsName,
        count: count,
        price: price,
        images: images,
        isCheck: isCheck
      );
      cartList.add(newGoods);
    } else {
      cartList[index].count += 1;
    }

    // 三、保存到 SharedPreferences
    cartString = json.encode(cartList).toString();
    prefs.setString('cartInfo', cartString);

    // 四、重新计算总数
    await getGoodsList();


    notifyListeners();
  }

  // 删除某个商品
  deleteGoods(String goodsId) async {
    // 一、获取持久化存储的值
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartString = prefs.getString('cartInfo');
    int index = getGoodsIndex(goodsId);

    // 二、保存到 Provide
    cartList.removeAt(index);

    // 三、保存到 SharedPreferences
    cartString = json.encode(cartList).toString();
    prefs.setString('cartInfo', cartString);

    // 四、重新计算总数
    await getGoodsList();

    notifyListeners();
  }

  // 商品选择
  changeGoodsChecked(String goodsId) async{
    // 一、获取持久化存储的值
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartString = prefs.getString('cartInfo');
    int index = getGoodsIndex(goodsId);

    // 二、保存到 Provide
    cartList[index].isCheck = !cartList[index].isCheck;

    // 三、保存到 SharedPreferences
    cartString = json.encode(cartList).toString();
    prefs.setString('cartInfo', cartString);

    // 四、重新计算总数
    getGoodsList();

    notifyListeners();
  }

  // 商品选择
  changeAllGoodsChecked(bool checked) async{
    // 一、获取持久化存储的值
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartString = prefs.getString('cartInfo');

    // 二、保存到 Provide
    var index = 0;
    cartList.forEach((item) {
      cartList[index].isCheck = checked;
      index++;
    });

    // 三、保存到 SharedPreferences
    cartString = json.encode(cartList).toString();
    prefs.setString('cartInfo', cartString);

    // 四、重新计算总数
    getGoodsList();

    notifyListeners();
  }

  // 根据商品 id 获取商品的 index
  int getGoodsIndex(String goodsId) {
    int res = -1;
    int index = 0;
    cartList.forEach((item) {
      if (item.goodsId == goodsId) {
        res = index;
      }
      index++;
    });
    return res;
  }

  // 清空持久化数据
  remove() async {
    // 清空 SharedPreferences。清空之后就会变成 null
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear(); // 清空全部
    prefs.remove('cartInfo');
    print('清空完成-----------------');

    notifyListeners();
  }

}
