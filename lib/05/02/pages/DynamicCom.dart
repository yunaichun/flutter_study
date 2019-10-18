import 'package:flutter/material.dart';

class DynamicCom extends StatefulWidget {
  // 传递的变量
  String _title;
  DynamicCom(this._title);

  @override
  _DynamicComState createState() => _DynamicComState();
}

class _DynamicComState extends State<DynamicCom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // widget._title 可以直接取拿到的参数，也是神奇
        title: Text(widget._title),
      ),
      body: Center(
        child: Text(widget._title),
      ),
    );
  }
}