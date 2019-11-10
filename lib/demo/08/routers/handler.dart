import 'package:flutter/material.dart';

/* 路由 【https://github.com/theyakka/fluro】 */
import 'package:fluro/fluro.dart';

/* 详情组件 */
import '../components/detailpage.dart';


Handler detailPageHandler = Handler(
  // 路由参数是一个对象，对象的每个 key 对应的 value 是数组
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('路由传递的参数：$params'); // { id: [123, 22], name: [bb] }
    String goodsId = params['id'].first;
    return DetailPage(goodsId);
  }
);
