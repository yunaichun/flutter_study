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
       child: Text('111'),
    );
  }

}
