import 'package:flutter/material.dart';

/* 路由 【https://github.com/theyakka/fluro】 */
import 'package:fluro/fluro.dart';

/* 路由配置 */
import './routers/routes.dart';

/* 静态化路由 */
import './routers/application.dart';

/* 列表页 */
import './components/listpage.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //-------------------主要代码start
    final router = Router(); // fluro.dart
    Routes.configureRoutes(router); // routes.dart
    Application.router = router; // application.dart
    //-------------------主要代码end
    

    return Container(
      
      child: MaterialApp(
        title: 'fluro路由 - 列表页',
        debugShowCheckedModeBanner: false,
        //----------------主要代码start
        onGenerateRoute: Application.router.generator,
        //----------------主要代码end
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('fluro路由 - 列表页'),
          ),
          body: ListPage(),
        )
      ),
    );
  }
}
