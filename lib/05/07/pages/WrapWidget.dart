import 'package:flutter/material.dart';

class WrapWidget extends StatefulWidget {
  WrapWidget({Key key}) : super(key: key);

  _WrapWidgetState createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  // 申明一个 list 数组
  List<Widget> list;
  @override
  void initState() {
    super.initState();
    // 初始只有一个 添加按钮
    list = List<Widget>()..add(buildAddButton());
  }


  @override
  Widget build(BuildContext context) {
    // 得到屏幕的高度和宽度，用来设置 Container 的宽和高
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height / 2,
            color: Colors.grey,
            // 流式布局【里面是一个数组组件】
            child: Wrap(
              children: list,
              // 设置间距
              spacing: 26.0
            ),
          ),
        ),
      ),
    );
  }

  // 添加按钮
  Widget buildAddButton() {
    // 返回一个手势 Widget ，只用用于显示事件
    return GestureDetector(
      onTap: () {
        if (list.length < 9) {
          // 插入一个最新的图片
          setState(() {
            list.insert(list.length - 1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      )
    );
  }

  // 图片组件
  Widget buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }
}