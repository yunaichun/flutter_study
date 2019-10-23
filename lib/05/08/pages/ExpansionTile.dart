import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionTile'),
      ),
      body: Center(
        child: ExpansionTile(
          // 未展开的标题
          title: Text('ExpansionTile'),
          // 左边图标
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,
          // 展开后的子元素
          children: <Widget>[
            ListTile(
              title: Text('ExpansionTile title'),
              subtitle: Text('ExpansionTile subtitle'),
            )
          ],
          // 初始是否展开
          initiallyExpanded: true
        ),
      ),
    );
  }
}
