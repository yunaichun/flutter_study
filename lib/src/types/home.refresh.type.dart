/* 首页下拉响应 */

class HomeRefreshResponse {
  final String code;
  final String message;
  final List<HomeRefreshData> data;

  HomeRefreshResponse({
    this.code,
    this.message,
    this.data
  });

  factory HomeRefreshResponse.fromJson(Map<String, dynamic> parsedJson) {
    // 子属性 - 数组
    var list = parsedJson['data'] as List;
    List<HomeRefreshData> homeRefreshData = list.map((i) => HomeRefreshData.fromJson(i)).toList();
    
    return HomeRefreshResponse(
      code: parsedJson['code'],
      message: parsedJson['message'],
      data: homeRefreshData
    );
  }
}

/* 首页下拉数据 */
class HomeRefreshData {
  final String name;
  final String image;
  final String goodsId;
  // 价格类型要定义为 dynamic ， 因为是 Double 或 Int ， 不然会报错
  final dynamic mallPrice;
  final dynamic price;

  HomeRefreshData({
    this.name,
    this.image,
    this.goodsId,
    this.mallPrice,
    this.price
  });

  factory HomeRefreshData.fromJson(Map<String, dynamic> parsedJson) {
    return HomeRefreshData(
      name: parsedJson['name'],
      image: parsedJson['image'],
      goodsId: parsedJson['goodsId'],
      mallPrice: parsedJson['mallPrice'],
      price: parsedJson['price']
    );
  }
}
