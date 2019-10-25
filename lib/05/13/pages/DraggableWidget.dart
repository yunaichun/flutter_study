import 'package:flutter/material.dart';
import './D.dart';

class DraggableWidget extends StatefulWidget {
  DraggableWidget({Key key}) : super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  // 目标元素的颜色
  Color _targetColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          D(
            offset: Offset(80.0, 80.0),
            color: Colors.tealAccent,
          ),
          D(
            offset: Offset(180.0, 80.0),
            color: Colors.redAccent,
          ),
          Center(
            // 拖拽到的目标元素
            child: DragTarget(
              // 接收拖拽元素传递的数据
              onAccept: (Color color) {
                _targetColor = color;
              },
              // 目标元素实际子元素: 里边进行修改child值
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 200.0,
                  height: 200.0,
                  color: _targetColor,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
