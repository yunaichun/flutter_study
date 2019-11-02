import 'package:flutter/material.dart';
/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';
/* 将 json 对象转换为 dart 对象：json.decode */
import 'dart:convert';
/* 数据格式 */
import '../../types/home.refresh.type.dart';
/* 数据请求 */
import '../../service/home.dart';

class HotWidget extends StatefulWidget {
  HotWidget({Key key}) : super(key: key);

  @override
  _HotWidgetState createState() => _HotWidgetState();
}

class _HotWidgetState extends State<HotWidget> {

  List<HomeRefreshData> hotList = [];

  @override
  void initState() { 
    super.initState();
    var formData = { 'page': '1' };
    gethomePageBelowConten(formData: formData).then((res) {
      setState(() {
        // 这里要用 json.decode ， 不然会报错； 同时价格类型要定义为 dynamic
        HomeRefreshResponse response = new HomeRefreshResponse.fromJson(json.decode(res));
        hotList = response.data;
      });
    });
  }

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
    if (hotList.length != 0) {
      List<Widget> list = hotList.map((item) {
        return InkWell(
          onTap: () {
            print('点击了火爆商品');
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
