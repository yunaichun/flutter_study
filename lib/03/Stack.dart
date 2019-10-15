import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        body: Center(
          child: Container(
            // Stack 布局子组件是 children
            child: Stack(
              // alignment 属性是控制层叠的位置的，建议在两个内容进行层叠时使用
              // 它有两个值 X 轴 距离和 Y 轴 距离，值是从 0 到 1 的，都是从上层容器的左上角开始算起的
              alignment: const FractionalOffset(0.5, 0.8),
              children: <Widget>[
                // 圆形头像
                CircleAvatar(
                  // Image.network('https://avatars3.githubusercontent.com/u/15957114?s=460&v=4')
                  backgroundImage: NetworkImage('https://avatars3.githubusercontent.com/u/15957114?s=460&v=4'),
                  radius: 100.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Yunaichun'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}