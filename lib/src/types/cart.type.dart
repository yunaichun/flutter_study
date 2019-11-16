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

  // 这个方法相当重要，可以将一个  Map<String, dynamic> 对象通过 add 添加至 List<CartItem> 中
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
