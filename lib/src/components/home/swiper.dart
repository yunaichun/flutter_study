import 'package:flutter/material.dart';
/* 轮播图：https://github.com/best-flutter/flutter_swiper */
import 'package:flutter_swiper/flutter_swiper.dart';
/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 静态化路由 */
import '../../routers/application.dart';

/* 数据格式 */
import '../../types/home.type.dart';


class SwiperWidget extends StatelessWidget {
  // 传递参数
  final List<SwiperData> swiperData;
  const SwiperWidget({Key key, this.swiperData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    print('设备宽度:${ScreenUtil.screenWidth}');
    print('设备高度:${ScreenUtil.screenHeight}');
    print('设备像素密度:${ScreenUtil.pixelRatio}');

    // 所有的组件最外层都包裹一层 Container
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Application.router.navigateTo(context, '/detail?id=${swiperData[index].goodsId}');
            },
            child: Image.network(swiperData[index].image)
          );
        },
        itemCount: swiperData.length,
        // 分页标点
        pagination: new SwiperPagination(),
        // 自动播放
        autoplay: true,
      ),
    );
  }
}
