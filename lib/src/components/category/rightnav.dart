import 'package:flutter/material.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/category.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 将 json 对象转换为 dart 对象：json.decode */
import 'dart:convert';
/* 数据格式 */
import '../../types/category.type.dart';
import '../../types/goods_list.type.dart';
/* 数据请求 */
import '../../service/category.dart';

class RightnavWidget extends StatefulWidget {
  final List<SubCategoryData> list;
  RightnavWidget({Key key, this.list}) : super(key: key);

  @override
  _RightnavWidgetState createState() => _RightnavWidgetState();
}

class _RightnavWidgetState extends State<RightnavWidget> {

  @override
  void initState() { 
    super.initState();
  }

  // 获取商品数据【使用可选参数】
  _getMallGoods({ String categoryId, String categorySubId }) {
    /* 很奇怪的一个现象：点击子类的时候会调用2次
      其中一次是 categoryId 和 categorySubId 都不传递任何参数
    */
    if(categoryId == null && categorySubId == null) {
      return;
    }
    var formData = { 
      'categoryId': categoryId == null ? '' : categoryId,
      'categorySubId': categorySubId == null ? '' : categorySubId,
      'page': 1
    };
    getMallGoods(formData: formData).then((res) {
      // 这里需要用 json.decode , 不然会报错，因为定义的字段含有 dynamic 类型
      GoodsListResponse response = new GoodsListResponse.fromJson(json.decode(res));
      List<GoodsListData> goodsList = response.data;
      Provide.value<CategoryProvider>(context).setGoodsList(goodsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(570),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12)
        )
      ),
       child: ListView.builder(
         // 水平方向布局
         scrollDirection: Axis.horizontal,
         itemCount: widget.list.length,
         itemBuilder: (context, index) {
           return _NavItem(index);
         },
       )
    );
  }

  // 二级分类子项
  Widget _NavItem(index) {
    return InkWell(
      onTap: () {
        /* 一、改变二级分类 index */
        Provide.value<CategoryProvider>(context).clickSubCategory(index);
        _getMallGoods();
         /* 二、改变商品列表 */
        var categoryId = widget.list[index].mallCategoryId;
        var categorySubId = widget.list[index].mallSubId;
        // 可选参数调用：一级分类在当前 index 可以获取【就不用从 provide 里面获取了】，二级分类从当前点击 index 获取
        _getMallGoods(categoryId: categoryId, categorySubId: categorySubId);
        /* 三、重置分页 */
        Provide.value<CategoryProvider>(context).resetPage();
      },
      child: Provide<CategoryProvider>(
        builder: (context, child, category) {
          bool isClick = false;
          isClick = (index == category.categorySubIndex) ? true : false;
          return Container(
            padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            child: Text(
              widget.list[index].mallSubName,
              style: TextStyle(
                color: isClick ? Colors.pink : Colors.black,
                fontSize: ScreenUtil().setSp(28)
              ),
            ),
          );
        },
      )
    );
  }

}