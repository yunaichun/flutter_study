import 'package:flutter/material.dart';

/* 屏幕适配：https://github.com/OpenFlutter/flutter_screenutil */
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 拨打电话、跳转链接：https://github.com/flutter/plugins/tree/master/packages/url_launcher/url_launcher */
import 'package:url_launcher/url_launcher.dart';

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _myListTile('领取优惠券'),
          _myListTile('已领取优惠券'),
          _myListTile('地址管理'),
          InkWell(
            onTap: () {
              _launchUrl();
            },
            child: _myListTile('客服电话'),
          ),
          _myListTile('关于我们')
        ],
      ),
    );
  }

  // 通用的 ListTile
  Widget _myListTile(String title){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12)
        )
      ),
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  // 拨打电话功能
  void _launchUrl() async {
    // String url = 'tel:'+ telephoneData.leaderPhone;
    String url = 'tel:13132290863';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}