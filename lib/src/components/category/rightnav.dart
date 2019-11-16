import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/category.dart';

/* 数据格式 */
import '../../types/category.type.dart';

class RightnavWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryProvider>(
      builder: (context, child, val) {
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
            itemCount:val.subCategoryList.length,
            itemBuilder: (context, index) {
              return _NavItem(
                context,
                val.subCategoryList,
                val.categorySubIndex,
                index
              );
            },
          )
        );
      }
    );
  }

  // 二级分类子项
  Widget _NavItem(
    BuildContext context,
    List<SubCategoryData> subCategoryList,
    int categorySubIndex,
    int index
  ) {
    bool isClick = false;
    isClick = (index == categorySubIndex) ? true : false;
    return InkWell(
      onTap: () {
        Provide.value<CategoryProvider>(context).clickSubCategory(index);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          subCategoryList[index].mallSubName,
          style: TextStyle(
            color: isClick ? Colors.pink : Colors.black,
            fontSize: ScreenUtil().setSp(28)
          ),
        ),
      ),
    );
  }

}
