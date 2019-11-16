/* 这里必须引入 material.dart 文件 */
import 'package:flutter/material.dart';

/* 数据格式 */
import '../types/category.type.dart';
import '../types/goods_list.type.dart';

class CategoryProvider with ChangeNotifier {
  
  int page = 1;
  int categoryIndex = 0;
  int categorySubIndex = 0;
  List<CategoryData> categoryList = [];
  List<GoodsListData> goodsList = [];

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

  setGoodsList(List<GoodsListData> list) {
    goodsList = list;
    notifyListeners();
  }
  
  addPage() {
    page++;
    notifyListeners();
  }

  resetPage() {
    page = 1;
    notifyListeners();
  }

  homeToCategory(String mallCategoryId) {
    int index = 0;
    categoryList.forEach((item) {
      if (item.mallCategoryId == mallCategoryId) {
        categoryIndex = index;
      }
      index++;
    });
    categorySubIndex = 0;
    page = 1;
    notifyListeners();
  }
}
