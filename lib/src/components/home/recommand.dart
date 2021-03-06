import 'package:flutter/material.dart';
/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 静态化路由 */
import '../../routers/application.dart';

class RecommendWidget extends StatelessWidget {
  final List recommendData;
  const RecommendWidget({Key key, this.recommendData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      /* 全部设置：EdgeInsets.all(10.0) */
      /* 分别设置：EdgeInsets.fromLTRB(10.0, 2.0, 0,5.0) */
      margin: EdgeInsets.only(
        top: 10.0
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _recommandTitle(),
            _recommedList()
          ],
        )
      ),
    );
  }

  // 推荐商品标题
  Widget _recommandTitle() {
    return Container(
      child: Text(
        '商品推荐',
        // 给文本设置样式
        style: TextStyle(
          color: Colors.pink
        ),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0,5.0),
      decoration: BoxDecoration(
        // 背景颜色
        color: Colors.white,
        /* 全部边框：Border.all(width: 2.0, color: Colors.red), */
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.white12)
        )
      ),
    );
  }

  // 商品推荐列表
  Widget _recommedList(){
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        // 排列方向：水平排列
        scrollDirection: Axis.horizontal,
        itemCount: recommendData.length,
        itemBuilder: (context, index) {
          return __recommedItem(context, index);
        },
      ),
    );
  }

  // 商品推荐每一项
  Widget __recommedItem(context, int index){
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, '/detail?id=${recommendData[index].goodsId}');
      },
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 1.0, color: Colors.black12)
          )
        ),
        /* 解决 bug：
           1、防止溢出+滑动：SingleChildScrollView + GridView(physics: NeverScrollableScrollPhysics())
           2、防止溢出：SingleChildScrollView + Column
           3、最终解决方案：ListView
        */
        child: ListView(
          children: <Widget>[
            Image.network(
              recommendData[index].image,
              height: ScreenUtil().setHeight(220),
            ),
            Text('￥${recommendData[index].mallPrice}'),
            Text(
              '￥${recommendData[index].price}',
              // 给文本设置样式
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough
              ),
            ),
          ],
        )
      )
    );
  }
}
