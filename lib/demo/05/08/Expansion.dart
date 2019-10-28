import 'package:flutter/material.dart';
import './pages/ExpansionTile.dart';
import './pages/ExpansionPanelList.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpansionWidget',
      theme: new ThemeData.dark(),
      // home: ExpansionTileWidget()
      home: ExpansionPanelListWidget()
    );
  }
}
