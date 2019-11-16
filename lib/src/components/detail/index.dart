import 'package:flutter/material.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/goods_detail.dart';

/* 组件 */
import './top.dart';
import './explain.dart';
import './tabBar.dart';

class DetailPage extends StatelessWidget {
  final String goodsId;
  DetailPage(this.goodsId);
  // 不能传 key 会报错
  // DetailPage({Key key, this.goodsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '商品详细页',
      theme: ThemeData(
        primaryColor: Colors.pink
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon:Icon(Icons.arrow_back),
            onPressed: (){
              print('返回上一页');
              Navigator.pop(context);
            },
            ),
          title: Text('商品详细页'),
        ),
        body: FutureBuilder(
          future: _getGoodsDetail(context),
          builder: (context, snapshot){
            if(snapshot.hasData){
                return Container(
                  child: Column(
                        children: <Widget>[
                          TopWidget(),
                          ExplainWidget(),
                          TabBarWidget()
                        ],
                  )
                );
            }else{
                return Text('加载中........');
            }
          }
        )
      ),
    );
  }

  /* 注意：
    1、Future封装成方法的时候，必须要有 return
    2、直接在组件中调用请求则不需要考虑
  */
  Future _getGoodsDetail(BuildContext context) async {
    await Provide.value<GoodsDetailProvider>(context).getGoodsDetailRequest(goodsId);
    return '完成加载';
  }

}
