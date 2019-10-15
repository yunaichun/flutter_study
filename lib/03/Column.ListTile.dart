import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column.ListTile',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Column.ListTile'),
        ),
        body: Center(
          child: Container(
            // Column 子组件是 children
            child: Column(
              children: <Widget>[
                // ListTile不光可以使用在ListView组件中，然后容器组件其实都可以使用
                ListTile(
                  title: Text(
                    '主标题1',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('副标题1'),
                  leading: Icon(
                    Icons.account_box,
                    color: Colors.lightBlue,
                  ),
                ),
                // 分割线
                Divider(),
                ListTile(
                  title: Text(
                    '主标题2',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('副标题2'),
                  leading: Icon(
                    Icons.account_box,
                    color: Colors.lightBlue,
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}