import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      // 这里有一个 issue: https://github.com/flutter/flutter/issues/15919
      home: ListPage(),
    );
  }
}

class ListPage extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListPage'),
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text('查看详情'), 
            onPressed: () {
              print(11112222);
              // 通过 Navigator.push 路由跳转
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => DetailPage())
              );
            },
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailPage'),
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text('返回'),
            onPressed: () {
              // 通过 Navigator.pop 路由返回
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
