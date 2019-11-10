/* 这里必须引入 material.dart 文件 */
import 'package:flutter/material.dart';

/* 数据格式 */
import '../types/category.type.dart';
import '../types/goods.type.dart';

class CategoryProvider with ChangeNotifier {
  
  int page = 1;
  int categoryIndex = 0;
  int categorySubIndex = 0;
  List<CategoryData> categoryList = [];
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

  setCategoryList(List<CategoryData> list) {
    categoryList = list;
    notifyListeners();
  }

  setGoodsList(List<GoodsData> list) {
    goodsList = list;
    notifyListeners();
  }
  
  addPage() {
    page++;
    notifyListeners();
  }
}
