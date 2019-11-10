class GoodsResponse {
  final String code;
  final String message;
  List<GoodsData> data;

  GoodsResponse({
    this.code,
    this.message,
    this.data
  });

  factory GoodsResponse.fromJson(Map<String, dynamic> parsedJson) {
    // 子属性 - 数组
    var list = parsedJson['data'] as List;
    // 醉了 - 后台没有数据返回的是 null, 而不是空数组 []
    if (list == null) {
      list = [];
    }
    List<GoodsData> data = list.map((i) => GoodsData.fromJson(i)).toList();
    return GoodsResponse(
      code: parsedJson['code'],
      message: parsedJson['message'],
      data: data
    );
  }
}

class GoodsData {
  final String goodsName;
  final String image;
  final String goodsId;
  // 价格类型要定义为 dynamic ， 因为是 Double 或 Int ， 不然会报错
  final dynamic oriPrice;
  final dynamic presentPrice;

  GoodsData({
    this.goodsName,
    this.image,
    this.goodsId,
    this.oriPrice,
    this.presentPrice,
  });

  factory GoodsData.fromJson(Map<dynamic, dynamic> parsedJson) {
    return GoodsData(
      goodsName: parsedJson['goodsName'],
      image: parsedJson['image'],
      goodsId: parsedJson['goodsId'],
      oriPrice: parsedJson['oriPrice'],
      presentPrice: parsedJson['presentPrice']
    );
  }
}
