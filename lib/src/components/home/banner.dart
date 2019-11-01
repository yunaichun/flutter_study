import 'package:flutter/material.dart';
import '../../types/home.type.dart';

class BannerWidget extends StatelessWidget {
  final BannerData bannerData;
  const BannerWidget({Key key, this.bannerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(bannerData.PICTURE_ADDRESS)
    );
  }
}