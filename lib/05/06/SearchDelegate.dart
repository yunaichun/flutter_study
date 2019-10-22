import 'package:flutter/material.dart';
import './pages/OverrideSearchDelegate.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'SearchDelegate',
      theme: ThemeData.light(),
      home: SearchDelegateWidget()
    );
  }
}