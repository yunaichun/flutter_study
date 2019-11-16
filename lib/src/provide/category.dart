/* 这里必须引入 material.dart 文件 */
import 'package:flutter/material.dart';

/* toast友好提示 【https://github.com/PonnamKarthik/FlutterToast】 */
import 'package:fluttertoast/fluttertoast.dart';

/* 数据请求 */
import '../service/category.dart';
/* 将 json 对象转换为 dart 对象：json.decode */
import 'dart:convert';
/* 数据格式 */
import '../types/category.type.dart';
import '../types/goods_list.type.dart';

class CategoryProvider with ChangeNotifier {
  
  int page = 1;
  int categoryIndex = 0;
  int categorySubIndex = 0;
  List<CategoryData> categoryList = [];
  List<SubCategoryData> subCategoryList = [];
  List<GoodsListData> goodsList = [];
  SubCategoryData all = new SubCategoryData(
    mallCategoryId: '',
    mallSubId: '',
    mallSubName: '全部',
    comments: 'null',
  );

  // 获取分类数据
  getCategoryDEVRequest() async {
    await getCategoryDEV().then((res) { 
      // 这里不用 json.decode , 不然会报错, 因为定义的字段不含有 dynamic 类型
      CategoryResponse response = new CategoryResponse.fromJson(res);
      categoryList = response.data;
      subCategoryList.add(all);
      subCategoryList.addAll(response.data[0].bxMallSubDto);

      notifyListeners();
    });
  }

  // 获取商品数据【使用可选参数】
  getMallGoodsRequest({ String categoryId, String categorySubId, int page }) async {
    var formData = { 
      'categoryId': categoryId == null ? categoryList[0].mallCategoryId : categoryId,
      'categorySubId': categorySubId == null ? '' : categorySubId,
      'page':  page == null ? 1 : page,
    };
    await getMallGoods(formData: formData).then((res) {
      // 这里需要用 json.decode , 不然会报错，因为定义的字段含有 dynamic 类型
      GoodsListResponse response = new GoodsListResponse.fromJson(json.decode(res));
      if (response.data.length != 0) {
        goodsList.addAll(response.data);
      } else {
        Fluttertoast.showToast(
          msg: "已经到底了",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 16.0
        );
      }

      notifyListeners();
    });
  }

  // 初始化页面操作
  initinalPage() async {
    await getCategoryDEVRequest();
    await getMallGoodsRequest();

    notifyListeners();
  }

  // 点击一级分类
  clickCategory(int index) async{
    categoryIndex = index;
    categorySubIndex = 0;
    page = 1;
    subCategoryList.add(all);
    subCategoryList.addAll(categoryList[index].bxMallSubDto);
    // 商品是累加的，请求前先清空
    goodsList = [];

    await getMallGoodsRequest(
      categoryId: categoryList[index].mallCategoryId,
      categorySubId: subCategoryList[0].mallSubId,
      page: 1
    );

    notifyListeners();
  }

  // 点击二级分类
  clickSubCategory(int index) async{
    categorySubIndex = index;
    page = 1;
    // 商品是累加的，请求前先清空
    goodsList = [];

    await getMallGoodsRequest(
      categoryId: categoryList[categoryIndex].mallCategoryId,
      categorySubId: subCategoryList[index].mallSubId,
      page: 1
    );

    notifyListeners();
  }

  // 商品上拉刷新
  pullUpRefresh() async{
    page++;
    await getMallGoodsRequest(
      categoryId: categoryList[categoryIndex].mallCategoryId,
      categorySubId: subCategoryList[categorySubIndex].mallSubId,
      page: page
    );

    notifyListeners();
  }
  
  // 首页导航跳转到分类页
  homeToCategory(String mallCategoryId) async {
    int index = 0;
    categoryList.forEach((item) {
      if (item.mallCategoryId == mallCategoryId) {
        categoryIndex = index;
      }
      index++;
    });
    categorySubIndex = 0;
    page = 1;
    // 商品是累加的，请求前先清空
    goodsList = [];
    // 二级分类也要改啊
    subCategoryList.add(all);
    subCategoryList.addAll(categoryList[categoryIndex].bxMallSubDto);

    await getMallGoodsRequest(
      categoryId: mallCategoryId,
      categorySubId: subCategoryList[categorySubIndex].mallSubId,
      page: page
    );

    notifyListeners();
  }
}
