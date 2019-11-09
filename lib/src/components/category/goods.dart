import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 数据格式 */
import '../../types/goods.type.dart';


class GoodsWidget extends StatefulWidget {
  final List<GoodsData> list;
  GoodsWidget({Key key, this.list}) : super(key: key);

  @override
  _GoodsWidgetState createState() => _GoodsWidgetState();
}

class _GoodsWidgetState extends State<GoodsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(570) ,
      height: ScreenUtil().setHeight(1000),
      child: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return _GoodItem(index);
        },
      )
    );
  }

  Widget _GoodItem(int index) {
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
            _imageWidget(index),
            Column(
              children: <Widget>[
                _goodsName(index),
                _goodsPrice(index)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _imageWidget(int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(widget.list[index].image),
    );
  }

  Widget _goodsName(int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        widget.list[index].goodsName,
        // 最大两行，超出省略号
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(int index) {
    return Container(
      margin: EdgeInsets.only(top:20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 5.0, right: 20.0),
            child:Text(
              '价格:￥${widget.list[index].presentPrice}',
              style: TextStyle(
                color:Colors.pink,
                fontSize:ScreenUtil().setSp(30)
              ),
            ),
          ),
          Text(
            '￥${widget.list[index].oriPrice}',
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
