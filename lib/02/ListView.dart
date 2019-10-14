import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: Center(
            // ListView 的子组件用 children
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.access_time),
                  title: Text('access_time'),
                ),
                ListTile(
                  leading: Icon(Icons.account_balance),
                  title: Text('account_balance'),
                ),
                Image.network('https://avatars3.githubusercontent.com/u/15957114?s=460&v=4'),
              ],
            ),
          ),
      ),
    );
  }
}
