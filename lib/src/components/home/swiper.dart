import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatelessWidget {
  // 传递参数
  final List swiperDataList;
  const SwiperWidget({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 所有的组件最外层都包裹一层 Container
    return Container(
      height: 333.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(swiperDataList[index].image);
        },
        itemCount: swiperDataList.length,
        // 分页标点
        pagination: new SwiperPagination(),
        // 自动播放
        autoplay: true,
      ),
    );
  }
}