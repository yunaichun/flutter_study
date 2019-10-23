import 'package:flutter/material.dart';
import './pages/ExpansionTile.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpansionWidget',
      theme: new ThemeData.dark(),
      home: ExpansionTileWidget()
    );
  }
}
