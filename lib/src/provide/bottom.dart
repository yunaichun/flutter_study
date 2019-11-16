import 'package:flutter/material.dart';

class BottomIndexProvide with ChangeNotifier{
  int currentIndex = 0;
  
  changeIndex(int index){
    currentIndex = index;
    notifyListeners();
  }

}
