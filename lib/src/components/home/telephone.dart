import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
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
    String url = 'tel:'+ telephoneData.leaderPhone;
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}
