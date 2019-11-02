import 'package:flutter/material.dart';
/* 将 json 对象转换为 dart 对象：json.decode */
import 'dart:convert';
/* 数据格式 */
import '../../types/home.type.dart';
/* 数据请求 */
import '../../service/home.dart';

/* 轮播图组件 */
import './swiper.dart';
/* 导航组件 */
import './navigator.dart';
/* 广告位组件 */
import './banner.dart';
/* 拨打电话组件 */
import './telephone.dart';
/* 推荐商品组件 */
import './recommand.dart';
/* 楼层组件 */
import './floor.dart';
/* 火爆专区组件 */
import './hot.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /* 方法一：initState 初始化数据
    List<SwiperData> swiperData = [];
    @override
    void initState() {
      super.initState();
      gethomePageContextDEV().then((res) {
        setState(() {
          // 这里不用 json.decode ,会报错
          HomeResponse response = new HomeResponse.fromJson(res);
          swiperData = response.data.slides;
        });
      });
    } 
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      /* 方法二：通过 FutureBuilder 初始化数据 */
      body: FutureBuilder(
        future: gethomePageContextDEV(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            HomeResponse response = new HomeResponse.fromJson(snapshot.data);

            /* 首页轮播图数据 */
            List<SwiperData> swiperData = response.data.slides;
            /* 首页导航数据 */
            List<NavigatorData> navigatorData = response.data.category;
            /* 首页广告位数据 */
            BannerData bannerData = response.data.advertesPicture;
            /* 首页电话数据 */
            TelephoneData telephoneData = response.data.shopInfo;
            /* 首页推荐位数据 */
            List<RecommendData> recommendData = response.data.recommend;
            /* 首页楼层数据 */
            FloorPicData floor1PicData = response.data.floor1Pic;
            List<FloorData> floor1Data = response.data.floor1;
            FloorPicData floor2PicData = response.data.floor2Pic;
            List<FloorData> floor2Data = response.data.floor2;
            FloorPicData floor3PicData = response.data.floor3Pic;
            List<FloorData> floor3Data = response.data.floor3;

            // 超出边界处理：外层包裹一层 SingleChildScrollView ，但是内部不能有 ListView ， 后续再解决
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                    SwiperWidget(swiperData: swiperData),
                    NavigatorWidget(navigatorData: navigatorData),
                    BannerWidget(bannerData: bannerData),
                    TelephoneWidget(telephoneData: telephoneData),
                    RecommendWidget(recommendData: recommendData),
                    FloorWidget(floorPicData: floor1PicData, floorData: floor1Data),
                    FloorWidget(floorPicData: floor2PicData, floorData: floor2Data),
                    FloorWidget(floorPicData: floor3PicData, floorData: floor3Data),
                    HotWidget()
                ],
              ),
            );
          } else {
            return Center(
              child: Text('加载中'),
            );
          }
        },
      )
    );
  }
}
