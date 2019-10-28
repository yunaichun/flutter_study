import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Row'),
        ),
        body: Center(
          child: Container(
            // Row 子组件是 children
            child: Row(
              children: <Widget>[
                // 不会被充满
                RaisedButton(
                  onPressed: () {},
                  color: Colors.redAccent,
                  child: Text('红色按钮'),
                ),
                // Expanded 代表此区域会被充满
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.orangeAccent,
                    child: Text('黄色按钮'),
                  ),
                ),
                // 不会被充满
                RaisedButton(
                  onPressed: () {},
                  color: Colors.pinkAccent,
                  child: Text('粉色按钮'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}