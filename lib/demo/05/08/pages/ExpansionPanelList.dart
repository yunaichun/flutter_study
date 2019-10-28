import 'package:flutter/material.dart';

class ExpansionPanelListWidget extends StatefulWidget {
  @override
  _ExpansionPanelListWidgetState createState() => _ExpansionPanelListWidgetState();
}

class _ExpansionPanelListWidgetState extends State<ExpansionPanelListWidget> {
  // 当前索引
  var currenIndex = -1;
  // 组成一个 int 类型数组，用来控制索引
  List<int> mList;
  // 展开的状态列表， ExpandStateBean 是自定义的类
  List<ExpandStateBean> expandStateList;
  // 构造方法，调用这个类的时候自动执行[相当于 initState ]
  _ExpansionPanelListWidgetState() {
    mList = new List();
    expandStateList = new List();
    // 便利为两个 List 进行赋值
    for (int i = 0; i < 20; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelList'),
      ),
      // 加入可滚动组件，ExpansionPanelList 必须放在可滚动组件内部
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          // 交互回掉属性，里边是个匿名函数
          expansionCallback: (index, isOpen) {
            setState(() {
              expandStateList.forEach((item) {
                if (item.index == index) {
                  item.isOpen = !isOpen;
                }
              });
            });
          },
          // 进行 map 操作，然后用 toList 再次组成 List
          children: mList.map((index) {
            return ExpansionPanel(
              // 未展开的 header
              headerBuilder: (context, isOpen) {
                return ListTile(
                  title: Text('No $index notOpen'),
                );
              },
              // 展开后的内容
              body: ListTile(
                title:Text('No.$index isOpen')
              ),
              // 是否展开
              isExpanded: expandStateList[index].isOpen
            );
          }).toList(),
        ),
      ),
    );
  }
}

// 自定义扩展状态类
class ExpandStateBean {
  var index;
  var isOpen;
  ExpandStateBean(this.index, this.isOpen);
}