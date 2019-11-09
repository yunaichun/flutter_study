import 'package:flutter/material.dart';
/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import './provide/category.dart';

/* 底部导航 */
import './bottom.dart';


/* 为了 demo 可以直接使用，在此文件里面用 provide 包装入口文件，
不在 main.dart 文件中包装了 */
MyApp() {
  var providers = Providers();
  var categoryProvider = CategoryProvider();
  providers..provide(Provider<CategoryProvider>.value(categoryProvider));
  return ProviderNode(
    child: Index(),
    providers: providers
  );
}

// 入口文件
class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 添加 container 是为了扩展
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        // 不显示右上角的 debug 商标
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: BottomNavigationBarWidget(),
      ),
    );
  }
}
