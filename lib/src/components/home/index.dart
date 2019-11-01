import 'package:flutter/material.dart';
/* json.decode 方法调用 */
import 'dart:convert';
/* 数据格式 */
import '../../data/home.type.dart';
/* 数据请求 */
import '../../service/home.dart';
/* 轮播图 */
import './swiper.dart';


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

            // 首页轮播图数据
            List<SwiperData> swiperData = response.data.slides;
            return Column(
               children: <Widget>[
                   SwiperWidget(swiperDataList: swiperData),
               ],
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
