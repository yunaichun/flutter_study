import 'package:flutter/material.dart';
import './data.dart';

class SearchBarDelegateWidget extends StatefulWidget {
  _SearchBarDelegateWidgetState createState() => _SearchBarDelegateWidgetState();
}

class _SearchBarDelegateWidgetState extends State<SearchBarDelegateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('SearchBarDelegateWidget'),
        // 顶部搜索图标
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.search),
            onPressed: (){
               print('开始搜索');
               // 内置的显示搜索
               showSearch(context: context, delegate: OverrideSearchDelegate());
            }
          ),
        ]
      )
    );
  }
}

class OverrideSearchDelegate extends SearchDelegate<String> {
  // 重写左边关闭按钮
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        // query 是内置的，指的是输入的值
        onPressed: () => query = '',
      )
    ];
  }

  // 重写右边返回按钮
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  // 重写点击搜索之后结果展示
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  // 重写搜索提示
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = 
    query.isEmpty ? 
    recentSuggest : // 搜索结果为空的话为默认推荐
    searchList.where((input) => input.startsWith(query)).toList(); // 搜索结果不为空
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: RichText(
          // 匹配到的结果黑色加粗
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              // 其余的结果暗黑色
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
              )
            ]
          ),
        ),
      ),
    );
  }
}
