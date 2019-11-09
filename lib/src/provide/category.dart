/* 这里必须引入 material.dart 文件 */
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {

  int categoryIndex = 0;
  int categorySubIndex = 0;
  
  setCategoryIndext(int index){
    categoryIndex = index;
    notifyListeners();
  }

  setSubCategoryIndext(int index){
    categoryIndex = index;
    notifyListeners();
  }

}
