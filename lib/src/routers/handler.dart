import 'package:flutter/material.dart';

/* 路由 【https://github.com/theyakka/fluro】 */
import 'package:fluro/fluro.dart';

/* 注意：
    有一个奇怪的现象，详情页面顶部返回调用 Navigator.pop(context) 可以返回
    但是，内部组件调用 Navigator.pop(context) 不能正常返回。
    解决方案是为主页面再定义一个路由。
*/
import '../index.dart';
/* 详情组件 */
import '../components/detail/index.dart';

Handler detailPageHandler = Handler(
  // 路由参数是一个对象，对象的每个 key 对应的 value 是数组
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('路由传递的参数：$params'); // { id: [123, 22], name: [bb] }
    String goodsId = params['id'].first;
    return DetailPage(goodsId);
  }
);

Handler rootPageHandler = Handler(
  // 路由参数是一个对象，对象的每个 key 对应的 value 是数组
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Index();
  }
);
