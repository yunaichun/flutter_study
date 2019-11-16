import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/goods_detail.dart';

/* flutter 中渲染 html 代码 【https://github.com/Sub6Resources/flutter_html】 */
import 'package:flutter_html/flutter_html.dart';

class DetailWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Provide<GoodsDetailProvider>(
      builder: (context, child, val) {
        if(val.goodsDetail != null) { 
          var goodsInfo = val.goodsDetail.goodInfo;
          if (val.currentTab == 1) {
            return Container(
              child: Html(
                data: goodsInfo.goodsDetail
              ),
            );
          } else {
            return Container(
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child:Text('评论数据暂无')
            );
          }
        }else {
          return Text('正在加载中......');
        }
      }
    );
  }
}
