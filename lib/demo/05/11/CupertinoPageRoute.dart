import 'package:flutter/material.dart';
import './pages/CupertinoPageRouteWidget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CupertinoPageRoute',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CupertinoPageRouteWidget(),
    );
  }
}