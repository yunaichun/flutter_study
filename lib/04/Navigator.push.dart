import 'package:flutter/material.dart';

// 声明数据结构类
class Product {
  final String title; // 商品标题
  final String description; // 商品描述
  Product(this.title, this.description);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator',
      // 这里有一个 issue: https://github.com/flutter/flutter/issues/15919
      home: ListPage(
        products: List.generate(
          20,
          (i) => Product('商品 $i', '这是一个商品详情，编号为:$i'),
        )
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  // 传递参数
  final List<Product> products;
  ListPage({Key key, @required this.products}):super(key:key);

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListPage'),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(products[index].title),
                onTap: () {
                  print(index);
                  Navigator.push(context, MaterialPageRoute(
                    // 传递参数不存在对象的写法
                    builder: (context) => DetailPage(product: products[index])
                  ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  // 接收参数
  final Product product;
  DetailPage({Key key, @required this.product}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text(product.description),
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
