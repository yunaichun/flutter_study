import 'package:flutter/material.dart';

/* 路由 【https://github.com/theyakka/fluro】 */
import 'package:fluro/fluro.dart';

/* 路由 handler */
import './handler.dart';

class Routes {
  /* 一、定义路由路径 */
  static String root = '/';
  static String detailPage = '/detail';

  /* 二、开始配置路由 */
  static void configureRoutes(Router router){
    /* 2.1、不存在的路由页面 */
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String,List<String>> params){
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
      }
    );
    
    /* 2.2、存在的页面路由 */
    /* 详情页 */
    router.define(detailPage, handler: detailPageHandler);
    /* 初始页 */
    router.define(root, handler: rootPageHandler);
  }

}
