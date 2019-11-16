/* 这里必须引入 material.dart 文件 */
import 'package:flutter/material.dart';

/* 数据格式 */
import 'package:flutter_study/src/types/goods_detail.type.dart';

/* 数据请求 */
import '../service/goods_detail.dart';
/* 将 json 对象转换为 dart 对象：json.decode */
import 'dart:convert';

class GoodsDetailProvider with ChangeNotifier {
  GoodsDetailData goodsDetail = null;

  //从后台获取商品信息
  getGoodsDetailRequest(String id) {
    var formData = { 'goodId': id };
    getGoodsDetail(formData:formData).then((res){
      // 这里不用 json.decode , 不然会报错, 因为定义的字段不含有 dynamic 类型
      GoodsDetailResponse response = new GoodsDetailResponse.fromJson(json.decode(res));
      print(response);
      goodsDetail = response.data;
      
      notifyListeners();
    });
  }

}
