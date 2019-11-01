import 'package:flutter/material.dart';
import '../../service/home.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String homeData = '正在获取数据';
  @override
  void initState() {
    super.initState();
    gethomePageContext().then((res) {
      setState(() {
        homeData = res.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: SingleChildScrollView(
        child: Text(homeData),
      ),
    );
  }
}