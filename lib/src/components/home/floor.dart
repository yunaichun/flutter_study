import 'package:flutter/material.dart';
/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';
/* 数据类型 */
import '../../types/home.type.dart';

class FloorWidget extends StatelessWidget {
  final FloorPicData floorPicData;
  final List<FloorData> floorData;
  const FloorWidget({
    Key key, 
    this.floorPicData,
    this.floorData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _floorTitle(),
          _floorContent()
        ],
      ),
    );
  }

  // 楼层标题
  Widget _floorTitle() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(floorPicData.PICTURE_ADDRESS),
    );
  }

  // 楼层内容
  Widget _floorContent() {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
          _secondRow()
        ],
      ),
    );
  }

  // 楼层 - 第一行
  Widget _firstRow() {
    return Container(
      child: Row(
        children: <Widget>[
          _goodsItem(floorData[0]),
          Column(
            children: <Widget>[
              _goodsItem(floorData[1]),
              _goodsItem(floorData[2])
            ],
          )
        ],
      ),
    );
  }

  // 楼层 - 第二行
  Widget _secondRow() {
    return Container(
      child: Row(
        children: <Widget>[
          _goodsItem(floorData[3]),
          _goodsItem(floorData[4]),
        ],
      ),
    );
  }

  // 每个商品内容
  Widget _goodsItem(FloorData goods) {
    return Container(
      width:ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          print('点击了楼层商品');
        },
        child: Image.network(goods.image),
      ),
    );
  }
}
