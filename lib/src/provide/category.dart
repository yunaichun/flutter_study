/* 这里必须引入 material.dart 文件 */
import 'package:flutter/material.dart';

/* 数据格式 */
import '../types/goods.type.dart';

class CategoryProvider with ChangeNotifier {

  int categoryIndex = 0;
  int categorySubIndex = 0;
  List<GoodsData> goodsList = [];

  clickCategory(int index){
    categoryIndex = index;
    categorySubIndex = 0;
    notifyListeners();
  }

  clickSubCategory(int index){
    categorySubIndex = index;
    notifyListeners();
  }

  setGoodsList(List<GoodsData> list) {
    goodsList = list;
  }
  
}
