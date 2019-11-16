import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/goods_detail.dart';

class TopWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    
    return Provide<GoodsDetailProvider>(
      builder: (context, child, val) {
        if(val.goodsDetail != null){
          // 这里可以通过 build 第三个参数获取，就不用再次调用 Provide 来获取值了
          // var goodsInfo = Provide.value<GoodsDetailProvider>(context).goodsDetail.goodInfo;
          var goodsInfo = val.goodsDetail.goodInfo;
          return Container(
            color: Colors.white,
            padding: EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                  _goodsImage(goodsInfo.image1),
                  _goodsName(goodsInfo.goodsName),  
                  _goodsNum(goodsInfo.goodsSerialNumber),
                  _goodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice)
              ],
            ),
          );
        } else {
          return Text('正在加载中......');
        }
      },
    );
  }

  //商品图片
  Widget _goodsImage(image) {
    return Image.network(
      image,
      width: ScreenUtil().setWidth(740) 
    );
  }

  //商品名称
  Widget _goodsName(goodsName) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        goodsName,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30)
        ),
      ),
    );
  }

  Widget _goodsNum(goodsSerialNumber){
    return  Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        '编号:$goodsSerialNumber',
        style: TextStyle(
          color: Colors.black26
        ),
      ),
    );
  }

  //商品价格方法

  Widget _goodsPrice(presentPrice, oriPrice){
    return  Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left:15.0),
      margin: EdgeInsets.only(top:8.0),
      child: Row(
        children: <Widget>[
          Text(
            '￥$presentPrice',
            style: TextStyle(
              color:Colors.pinkAccent,
              fontSize: ScreenUtil().setSp(40),
            ),
          ),
          Text(
            '市场价:￥$oriPrice',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
    );
  }

}
