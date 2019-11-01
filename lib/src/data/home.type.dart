/* 首页响应 */
class HomeResponse {
  final String code;
  final String message;
  final HomeData data;

  HomeResponse({
    this.code,
    this.message,
    this.data
  });

  factory HomeResponse.fromJson(Map<String, dynamic> parsedJson) {
    // 子属性 - 对象
    var homeDataObj = HomeData.fromJson(parsedJson['data']);
    return HomeResponse(
      code: parsedJson['code'],
      message: parsedJson['message'],
      data: homeDataObj
    );
  }
}

/* 首页数据 */
class HomeData {
  final List<SwiperData> slides;

  HomeData({
    this.slides
  });

  factory HomeData.fromJson(Map<String, dynamic> parsedJson) {
    // 子属性 - 数组
    var list1 = parsedJson['slides'] as List;
    List<SwiperData> swiperData = list1.map((i) => SwiperData.fromJson(i)).toList();

    return HomeData(
      slides: swiperData
    );
  }
}

  
// 一、轮播图数据
class SwiperData {
  final String image;
  final int urlType;
  final String goodsId;

  SwiperData({
    this.image,
    this.urlType,
    this.goodsId
  });

  factory SwiperData.fromJson(Map<String, dynamic> parsedJson) {
    return SwiperData(
      image: parsedJson['image'],
      urlType: parsedJson['urlType'],
      goodsId: parsedJson['goodsId'],
    );
  }
}
