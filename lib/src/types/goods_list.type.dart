class GoodsListResponse {
  final String code;
  final String message;
  List<GoodsListData> data;

  GoodsListResponse({
    this.code,
    this.message,
    this.data
  });

  factory GoodsListResponse.fromJson(Map<String, dynamic> parsedJson) {
    // 子属性 - 数组
    var list = parsedJson['data'] as List;
    // 醉了 - 后台没有数据返回的是 null, 而不是空数组 []
    // 保证 data 最后一定为数组类型
    if (list == null) {
      list = [];
    }
    List<GoodsListData> data = list.map((i) => GoodsListData.fromJson(i)).toList();
    return GoodsListResponse(
      code: parsedJson['code'],
      message: parsedJson['message'],
      data: data
    );
  }
}

class GoodsListData {
  final String goodsName;
  final String image;
  final String goodsId;
  // 价格类型要定义为 dynamic ， 因为是 Double 或 Int ， 不然会报错
  final dynamic oriPrice;
  final dynamic presentPrice;

  GoodsListData({
    this.goodsName,
    this.image,
    this.goodsId,
    this.oriPrice,
    this.presentPrice,
  });

  factory GoodsListData.fromJson(Map<dynamic, dynamic> parsedJson) {
    return GoodsListData(
      goodsName: parsedJson['goodsName'],
      image: parsedJson['image'],
      goodsId: parsedJson['goodsId'],
      oriPrice: parsedJson['oriPrice'],
      presentPrice: parsedJson['presentPrice']
    );
  }
}
