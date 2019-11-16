import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/goods_detail.dart';

class TabBarWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Provide<GoodsDetailProvider>(
      builder: (context, child, val) {
        return Container(
          margin: EdgeInsets.only(top: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _myTabBarLeft(context, val.currentTab),
                  _myTabBarRight(context, val.currentTab)
                ],
              ),
            ],
          ),    
        );
      },
    );
  }

  // 左边 tab
  Widget _myTabBarLeft(BuildContext context, int currentTab){
    return InkWell(
      onTap: (){
        Provide.value<GoodsDetailProvider>(context).setCurrentTab(1);
      },
      child: Container(
        width: ScreenUtil().setWidth(375),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: currentTab == 1 ? Colors.pink: Colors.black12 
            )
          )
        ),
        child: Text(
          '详情',
          style: TextStyle(
            color: currentTab == 1 ? Colors.pink : Colors.black 
          ),
        ),
      ),
    );
  }

  // 右边 tab
  Widget _myTabBarRight(BuildContext context, int currentTab){
    return InkWell(
      onTap: (){
        Provide.value<GoodsDetailProvider>(context).setCurrentTab(2);
      },
      child: Container(
        width: ScreenUtil().setWidth(375),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: currentTab == 2 ? Colors.pink: Colors.black12 
            )
          )
        ),
        child: Text(
          '评论',
          style: TextStyle(
            color: currentTab == 2 ? Colors.pink : Colors.black 
          ),
        ),
      ),
    );
  }

}
