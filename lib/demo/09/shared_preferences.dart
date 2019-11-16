import 'package:flutter/material.dart';

/* 数据持久化【https://github.com/flutter/plugins/tree/master/packages/shared_preferences】 */
import 'package:shared_preferences/shared_preferences.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<String> testList =[];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '数据持久化',
        home: Scaffold(
          appBar: AppBar(
            title: Text('数据持久化'),
          ),
          body: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 300.0,
                  child: ListView.builder(
                    itemCount: testList.length ,
                    itemBuilder: (context,index){
                      return ListTile(
                        title: Text('${testList[index]}$index'),
                      );
                    },
                  ) ,
                ),
                RaisedButton(
                  onPressed: () { _add(); },
                  child: Text('增加'),
                ),
                RaisedButton(
                  onPressed: () { _clear(); },
                  child: Text('清空'),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

  // 内存中有的话从内存中获取数据
  void _show() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if(prefs.getStringList('testInfo') != null) {
        testList = prefs.getStringList('testInfo');
      }
    });
  }

  // 向内存中添加一条数据
  void _add() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String temp = '商品编号';
      testList.add(temp);
      prefs.setStringList('testInfo', testList);
      _show();
  }

  // 向内存中删除整条数据
  void _clear() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //p refs.clear(); // 全部清空
    prefs.remove('testInfo'); // 删除 key 键
    setState((){
      testList = [];
    });
  }

}
