import 'package:flutter/material.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/category.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 数据格式 */
import '../../types/category.type.dart';

class RightnavWidget extends StatefulWidget {
  final List<SubCategoryData> list;
  RightnavWidget({Key key, this.list}) : super(key: key);

  @override
  _RightnavWidgetState createState() => _RightnavWidgetState();
}

class _RightnavWidgetState extends State<RightnavWidget> {
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