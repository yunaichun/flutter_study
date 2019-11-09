import 'package:flutter/material.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/category.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 数据格式 */
import '../../types/goods.type.dart';


class GoodsWidget extends StatefulWidget {
  GoodsWidget({Key key}) : super(key: key);

  @override
  _GoodsWidgetState createState() => _GoodsWidgetState();
}

class _GoodsWidgetState extends State<GoodsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(570) ,
      height: ScreenUtil().setHeight(1000),
      child: Provide<CategoryProvider>(
        builder: (context, child, category) {
          if (category.goodsList.length != 0) {
            return ListView.builder(
              itemCount: category.goodsList.length,
              itemBuilder: (context, index) {
                return _GoodItem(category.goodsList, index);
              },
            );
          } else {
            return Text('加载中');
          }
        })
    );
  }

  Widget _GoodItem(List<GoodsData> list, int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0,color: Colors.black12)
          )
        ),
        child: Row(
          children: <Widget>[
            _imageWidget(list, index),
            Column(
              children: <Widget>[
                _goodsName(list, index),
                _goodsPrice(list, index)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _imageWidget(List<GoodsData> list, int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(list[index].image),
    );
  }

  Widget _goodsName(List<GoodsData> list, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        list[index].goodsName,
        // 最大两行，超出省略号
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(List<GoodsData> list, int index) {
    return Container(
      margin: EdgeInsets.only(top:20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 5.0, right: 20.0),
            child:Text(
              '价格:￥${list[index].presentPrice}',
              style: TextStyle(
                color:Colors.pink,
                fontSize:ScreenUtil().setSp(30)
              ),
            ),
          ),
          Text(
            '￥${list[index].oriPrice}',
            style: TextStyle(
              color: Colors.black26,
              // 水平下划线
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
    );
  }

}
