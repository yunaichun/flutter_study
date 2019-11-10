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

class LeftnavWidget extends StatefulWidget {
  // 注意这里要定义为 final 
  final List<CategoryData> list;
  LeftnavWidget({Key key, this.list}) : super(key: key);

  @override
  _LeftnavWidgetState createState() => _LeftnavWidgetState();
}

class _LeftnavWidgetState extends State<LeftnavWidget> {

  @override
  void initState() {
    super.initState();
    _getMallGoods();
  }

  // 获取商品数据【使用可选参数】
  _getMallGoods({ String categoryId, String categorySubId }) {
    var formData = { 
      'categoryId': categoryId == null ? widget.list[0].mallCategoryId : categoryId,
      'categorySubId': categorySubId == null ? '' : categorySubId,
      'page': 1
    };
    getMallGoods(formData: formData).then((res) {
      // 这里需要用 json.decode , 不然会报错，因为定义的字段含有 dynamic 类型
      GoodsResponse response = new GoodsResponse.fromJson(json.decode(res));
      List<GoodsData> goodsList = response.data;
      Provide.value<CategoryProvider>(context).setGoodsList(goodsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 路由切换了，这里必须要再次初始化一次
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Container(
      width: ScreenUtil().setWidth(180),
      // height: ScreenUtil().setHeight(100),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1, color:Colors.black12)
        )
      ),
      child: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return _NavItem(index);
        },
      ),
      // child: Text('1111'),
    );
  }

  // 大类子项
  Widget _NavItem(index) {
    return InkWell(
      onTap: () {
        /* 一、改变一级分类 index */
        Provide.value<CategoryProvider>(context).clickCategory(index);
        /* 二、改变商品列表 */
        var categoryId = widget.list[index].mallCategoryId;
        var categorySubIndex = Provide.value<CategoryProvider>(context).categorySubIndex;
        var categorySubId = widget.list[index].bxMallSubDto[categorySubIndex].mallSubId;
        // 可选参数调用：一级分类从当前点击 index 获取，二级分类从 provide 里面获取
        _getMallGoods(categoryId: categoryId, categorySubId: categorySubId);
      },
      child: Provide<CategoryProvider>(
        builder: (context, child, category) {
          bool isClick = false;
          isClick = (index == category.categoryIndex) ? true : false;
          return Container(
            height: ScreenUtil().setHeight(100),
            padding: EdgeInsets.only(left: 10, top: 20),
            decoration: BoxDecoration(
              color: isClick ? Color.fromRGBO(236, 238, 239, 1.0) : Colors.white,
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.black12)
              )
            ),
            child: Text(
              widget.list[index].mallCategoryName,
              style: TextStyle(fontSize: ScreenUtil().setSp(28))
            ),
          );
        }
      )
    );
  }
}
