import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/bottom.dart';
import 'package:flutter_study/src/provide/category.dart';

class NavigatorWidget extends StatelessWidget {
  final List navigatorData;
  const NavigatorWidget({Key key, this.navigatorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 最多只显示 10 个图标
    if (navigatorData.length > 10) {
      navigatorData.removeRange(10, navigatorData.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      /* 单独设置间距：EdgeInsets.fromLTRB(left, top, right, bottom) */
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        /* GridView 禁止滑动
            GridView，这个和我们的ListView上拉加载是冲突的，我们的组件没有智能到为我们辨认，
            所以我们可以直接禁用 GridView 的滚动
        */
        physics: NeverScrollableScrollPhysics(),
        // 一排 5 个
        crossAxisCount: 5,
        children: navigatorData.map((item) => _gridViewItem(context, item)).toList()
      ),
    );
  }

  Widget _gridViewItem(BuildContext context, item) {
    return InkWell(
      onTap: () {
        Provide.value<CategoryProvider>(context).homeToCategory(item.mallCategoryId);
        Provide.value<BottomIndexProvide>(context).changeIndex(1);
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item.image,
            width: ScreenUtil().setWidth(95),
          ),
          Text(item.mallCategoryName)
        ],
      ),
    );
  }
}
