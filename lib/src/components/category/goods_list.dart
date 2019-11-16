import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 下拉刷新、上拉加载【https://github.com/xuelongqy/flutter_easyrefresh/】 */
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

/* 添加 provide 状态管理【https://github.com/google/flutter-provide】 */
import 'package:provide/provide.dart';
import 'package:flutter_study/src/provide/category.dart';

/* 静态化路由 */
import '../../routers/application.dart';

/* 数据格式 */
import '../../types/goods_list.type.dart';

class GoodsWidget extends StatelessWidget {
  var scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryProvider>(
        builder: (context, child, val) {
          // 每次切换分类的时候滚动条到最顶部
          try {
            if(val.page == 1){
              scrollController.jumpTo(0.0);
            }
          } catch(e) {
            print('进入页面第一次初始化：$e');
          }

          return Container(
            width: ScreenUtil().setWidth(570) ,
            height: ScreenUtil().setHeight(1000),
            child: EasyRefresh(
              child: ListView.builder(
                // 每次切换分类的时候滚动条到最顶部
                controller: scrollController,
                itemCount: val.goodsList.length,
                itemBuilder: (context, index) {
                  return _goodItem(context, val.goodsList, index);
                },
              ),
              onLoad: () async {
                print('onLoad 上拉事件');
                await val.pullUpRefresh();
                // Provide.value<BottomIndexProvide>(context).pullUpRefresh();
              },
              onRefresh: () async {
                print('onRefresh 下滑事件');
              },
              header: MaterialHeader(),
              footer: MaterialFooter(),
            )
          );
        }
      );
  }

  // 整体
  Widget _goodItem(
    BuildContext context,
    List<GoodsListData> list,
    int index
  ) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, '/detail?id=${list[index].goodsId}');
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0,color: Colors.black12)
          )
        ),
        child: Row(
          children: <Widget>[
            _imageWidget(list, index),
            Column(
              children: <Widget>[
                _goodsName(list, index),
                _goodsPrice(list, index)
              ],
            )
          ],
        ),
      ),
    );
  }

  // 商品图片
  Widget _imageWidget(List<GoodsListData> list, int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(list[index].image),
    );
  }

  // 商品名称
  Widget _goodsName(List<GoodsListData> list, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        list[index].goodsName,
        // 最大两行，超出省略号
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(List<GoodsListData> list, int index) {
    return Container(
      margin: EdgeInsets.only(top:20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 5.0, right: 20.0),
            child:Text(
              '价格:￥${list[index].presentPrice}',
              style: TextStyle(
                color:Colors.pink,
                fontSize:ScreenUtil().setSp(30)
              ),
            ),
          ),
          Text(
            '￥${list[index].oriPrice}',
            style: TextStyle(
              color: Colors.black26,
              // 水平下划线
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
    );
  }

}
