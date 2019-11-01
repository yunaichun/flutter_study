import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        // 一排 5 个
        crossAxisCount: 5,
        children: navigatorData.map((item) => _gridViewItem(context, item)).toList()
      ),
    );
  }

  Widget _gridViewItem(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
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