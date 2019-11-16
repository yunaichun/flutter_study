import 'package:flutter/material.dart';

/* 路由 【https://github.com/theyakka/fluro】 */
import 'package:fluro/fluro.dart';
/* 路由配置 */
import './routers/routes.dart';
/* 静态化路由 */
import './routers/application.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import './provide/category.dart';
import './provide/goods_detail.dart';

/* 底部导航 */
import './bottom.dart';


/* 为了 demo 可以直接使用，在此文件里面用 provide 包装入口文件，
不在 main.dart 文件中包装了 */
ProviderNode MyApp() {
  var providers = Providers();
  var categoryProvider = CategoryProvider();
  var goodsDetailProvider = GoodsDetailProvider();
  providers
  ..provide(Provider<CategoryProvider>.value(categoryProvider))
  ..provide(Provider<GoodsDetailProvider>.value(goodsDetailProvider));
  return ProviderNode(
    child: Index(),
    providers: providers
  );
}

// 入口文件
class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //-------------------路由主要代码start
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    //-------------------路由主要代码end

    // 添加 container 是为了扩展
    return Container(
      child: MaterialApp(
        title: '百姓生活+',
        // 不显示右上角的 debug 商标
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        //----------------路由主要代码start
        onGenerateRoute: Application.router.generator,
        //----------------路由主要代码end
        home: BottomNavigationBarWidget(),
      ),
    );
  }
}
