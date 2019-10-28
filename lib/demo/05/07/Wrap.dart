import 'package:flutter/material.dart';
import './pages/WrapWidget.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wrap',
      theme: new ThemeData.dark(),
      home: WrapWidget()
    );
  }
}