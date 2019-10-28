import 'package:flutter/material.dart';
import './pages/DraggableWidget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: DraggableWidget(),
    );
  }
}
