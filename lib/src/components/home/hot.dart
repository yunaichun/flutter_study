import 'package:flutter/material.dart';
/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';
/* 数据格式 */
import '../../types/home.refresh.type.dart';

/* 静态化路由 */
import '../../routers/application.dart';

class HotWidget extends StatefulWidget {
  /* 注意：
    1、动态组件的传值通过 widget.hotList 获取
    2、静态组件的传值可以直接通过定义的变量值获取
  */
  final List<HomeRefreshData> hotList;
  HotWidget({Key key, this.hotList}) : super(key: key);

  @override
  _HotWidgetState createState() => _HotWidgetState();
}

class _HotWidgetState extends State<HotWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: <Widget>[
           _hotTitle(),
           _hotContent()
         ],
       )
    );
  }

  // 标题
  Widget _hotTitle() {
    return Container(
      child: Text('火爆专区'),
      margin: EdgeInsets.only(top: 10.0),
      padding:EdgeInsets.all(5.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.black12)
        )
      ),
    );
  }

  // 内容
  Widget _hotContent() {
    if (widget.hotList.length != 0) {
      List<Widget> list = widget.hotList.map((item) {
        return InkWell(
          onTap: () {
            print('点击了火爆商品');
             Application.router.navigateTo(context, '/detail?id=${item.goodsId}');
          },
          child: Container(
            width: ScreenUtil().setHeight(372),
            color: Colors.white12,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(item.image),
                Text(
                  item.name,
                  // 最大一行，超出省略号
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  // 设置文本的样式
                  style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    // 只有 item 的时候用 $item 就行，不用加打括号 {}
                    Text('￥ ${item.mallPrice}'),
                    Text(
                      '￥ ${item.price}',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black26,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();

      /* GridView组件的性能时很低的，毕竟网格的绘制不难么简单，
      所以这里使用了Warp来进行布局。Warp是一种流式布局。 */
      return Wrap(
        children: list,
        spacing: 2,
      );
    } else {
      return Text('');
    }
  }
}
