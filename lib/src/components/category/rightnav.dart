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
import '../../types/goods.type.dart';
/* 数据请求 */
import '../../service/category.dart';

class RightnavWidget extends StatefulWidget {
  final List<SubCategoryData> list;
  final int categorySubIndex;
  RightnavWidget({Key key, this.list, this.categorySubIndex}) : super(key: key);

  @override
  _RightnavWidgetState createState() => _RightnavWidgetState();
}

class _RightnavWidgetState extends State<RightnavWidget> {

  @override
  void initState() { 
    super.initState();
    _getMallGoods();
  }

  // 获取商品数据
  _getMallGoods() {
    // 商品详情里面存储的有一级分类和二级分类的 ID
    var categorySubIndex = widget.categorySubIndex;
    print('打印的categorySubIndex $categorySubIndex');
    var formData = { 
      'categoryId': widget.list[categorySubIndex].mallCategoryId,
      'categorySubId': widget.list[categorySubIndex].mallSubId,
      'page': 1
    };
    getMallGoods(formData: formData).then((res) {
      setState(() {
        // 这里需要用 json.decode , 不然会报错，因为定义的字段含有 dynamic 类型
        GoodsResponse response = new GoodsResponse.fromJson(json.decode(res));
        List<GoodsData> goodsList = response.data;
        Provide.value<CategoryProvider>(context).setGoodsList(goodsList);
      });
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
        Provide.value<CategoryProvider>(context).clickSubCategory(index);
        _getMallGoods();
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