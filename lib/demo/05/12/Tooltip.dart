import 'package:flutter/material.dart';
import './pages/ToolTipWidget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tooltip',
      theme: ThemeData.light(),
      home: TooltipWidget(),
    );
  }
}