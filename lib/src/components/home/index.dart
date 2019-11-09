import 'package:flutter/material.dart';
/* 下拉刷新、上拉加载【https://github.com/xuelongqy/flutter_easyrefresh/】 */
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

/* 将 json 对象转换为 dart 对象：json.decode */
import 'dart:convert';
/* 数据格式 */
import '../../types/home.type.dart';
import '../../types/home.refresh.type.dart';
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
  // 定义下拉刷新需要的数据
  int page = 1;
  List<HomeRefreshData> hotList = [];

  /* 初始化数据方法：
    1、initState 初始化数据
    2、FutureBuilder 组件
   */
  @override
  void initState() {
    super.initState();
    /* 因为使用了 FutureBuilder ，所以这里不用请求了 */
    // _gethomePageContextDEV();
    /* 因为使用了 EasyRefresh 的 onLoad ，所以这里不用请求了 */
    // _gethomePageBelowConten();
  } 
 

  // 获取首页数据
  _gethomePageContextDEV() {
    gethomePageContextDEV().then((res) {
      setState(() {
        // 这里不用 json.decode , 不然会报错, 因为定义的字段不含有 dynamic 类型
        // HomeResponse response = new HomeResponse.fromJson(res);
      });
    });
  }

  // 获取下拉刷新数据
  _gethomePageBelowConten() {
    var formData = { 'page': '1' };
    gethomePageBelowConten(formData: formData).then((res) {
      setState(() {
        // 这里需要用 json.decode , 不然会报错，因为定义的字段含有 dynamic 类型
        HomeRefreshResponse response = new HomeRefreshResponse.fromJson(json.decode(res));
        hotList.addAll(response.data);
        page++;
      });
    });
  }

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
            // 这里不用 json.decode , 不然会报错, 因为定义的字段不含有 dynamic 类型
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
            
            /* 注意：
              1、Column 布局之外需要套一个 SingleChildScrollView ，防止越界
              2、SingleChildScrollView 内部不能有 ListView
              3、SingleChildScrollView 内部不能有 EasyRefresh ，不然不能下拉刷新
              4、EasyRefresh 必须用在根组件上
             */
            return EasyRefresh(
              child: ListView(
                children: <Widget>[
                    SwiperWidget(swiperData: swiperData),
                    NavigatorWidget(navigatorData: navigatorData),
                    BannerWidget(bannerData: bannerData),
                    TelephoneWidget(telephoneData: telephoneData),
                    RecommendWidget(recommendData: recommendData),
                    FloorWidget(floorPicData: floor1PicData, floorData: floor1Data),
                    FloorWidget(floorPicData: floor2PicData, floorData: floor2Data),
                    FloorWidget(floorPicData: floor3PicData, floorData: floor3Data),
                    HotWidget(hotList: hotList)
                ],
              ),
              onLoad: () async {
                print('onLoad 事件');
                await _gethomePageBelowConten();
              },
              onRefresh: () async {
                print('onRefresh 事件');
                await _gethomePageBelowConten();
              },
              header: MaterialHeader(),
              footer: MaterialFooter(),
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
