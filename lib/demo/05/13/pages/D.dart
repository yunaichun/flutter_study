import 'package:flutter/material.dart';

// 可以拖动组件的封装
class D extends StatefulWidget {
  final Offset offset;
  final Color color;
  // 无名无参所以需要调用 super
  D({Key key, this.offset, this.color}) : super(key: key);

  @override
  _DState createState() => _DState();
}

class _DState extends State<D> {
  // offset 为当前 widget 的 Offset
  Offset offset = Offset(0.0, 0.0);
  @override
  void initState() {
    super.initState();
    // widget 有点 js 中 this 的意思
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // 定位在当前 widget 的 Offset 位置
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        // 是要传递的参数，在 DragTarget 里，会接受到这个参数。要在拖拽控件推拽到 DragTarget 的时候。
        data: widget.color,
        // 在这里放置你要推拽的元素，可以是容器，也可以是图片和文字.
        child: Container(
          width: 100,
          height: 100,
          color: widget.color
        ),
        // 用于设置推拽元素时的样子。
        feedback: Container(
          width: 120.0,
          height: 120.0,
          color: widget.color.withOpacity(0.5),
        ),
        // 指的是不往目标 DragTarget 里面拖拽时的操作
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          setState(() {
            // 主要是控制拖拽结束后的位置 Positioned 
            this.offset = offset;
          });
        },
      )
    );
  }
}
