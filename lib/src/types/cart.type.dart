class CartItem {
  String goodsId;
  String goodsName;
  int count;
  double price;
  String images;

  CartItem({
    this.goodsId,
    this.goodsName,
    this.count,
    this.price,
    this.images,
  });

  factory CartItem.fromJson(Map<String, dynamic> parsedJson){
    return CartItem(
      goodsId: parsedJson['goodsId'],
      goodsName: parsedJson['goodsName'],
      count: parsedJson['count'],
      price: parsedJson['price'],
      images: parsedJson['images']
    );
  }

  /* 注意：
    1、如果使用 cartList = json.decode(cartString.toString());
        在调用 cartList.add 的时候会报错 'List<dynamic>' is not a subtype of type 'List<CartItem>'
        需要遍历下此数组，每一项都调用下 fromJson 方法
    2、Map<String, dynamic> 对象通过 add 添加至 List<CartItem>
        需要在 types 文件中写 toJson 方法 ！！！！！！！！！！！！！！
    3、根据数组遍历得到的结果最后别忘记 toList() 。如首页导航组件
        navigatorData.map((item) => _gridViewItem(context, item)).toList()
  */
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['goodsName'] = this.goodsName;
    data['count'] = this.count;
    data['price'] = this.price;
    data['images'] = this.images;
    return data;
  }
}
