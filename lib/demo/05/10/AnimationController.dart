import 'package:flutter/material.dart';
import './pages/AnimationControllerWidget.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimationController',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationControllerWidget()
    );
  }
}
