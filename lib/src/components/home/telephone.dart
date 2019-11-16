import 'package:flutter/material.dart';
/* 拨打电话、跳转链接：https://github.com/flutter/plugins/tree/master/packages/url_launcher/url_launcher */
import 'package:url_launcher/url_launcher.dart';
/* 数据类型 */
import '../../types/home.type.dart';

class TelephoneWidget extends StatelessWidget {
  final TelephoneData telephoneData;
  const TelephoneWidget({Key key, this.telephoneData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          _launchUrl();
        },
        child: Image.network(telephoneData.leaderImage),
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
