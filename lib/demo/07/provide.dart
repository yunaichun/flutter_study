import 'package:flutter/material.dart';
/* 状态管理 */
import 'package:provide/provide.dart';
/* 状态管理类 */
import './provide.counter.dart';

MyApp() {
  var counter = Counter();
  var providers  = Providers();

  // 使用一：顶层注入状态
  providers
    ..provide(Provider<Counter>.value(counter));
  return ProviderNode(child: CartPage(), providers: providers);
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provide',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provide'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Number(),
              MyButton()
            ],
          ),
        )
      ),
    );
  }
}


class Number extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:200),
      // 使用二：Provide 的 builder 构建：才能在方法调用时候，通知到页面重新渲染
      child: Provide<Counter>(
        builder: (context, child, counter){
          return Text(
            '${counter.value}',
             style: Theme.of(context).textTheme.display1,
          );
        },
      ),
    );
  }
}


class MyButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          // 使用三：获取 Provide 设置的方法和字段名
          Provide.value<Counter>(context).increment();
          // Provide.value<Counter>(context).value;
        },
        child: Text('递增'),
      )
    );
  }
}