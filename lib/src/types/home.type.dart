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
  final List<NavigatorData> category;

  HomeData({
    this.slides,
    this.category
  });

  factory HomeData.fromJson(Map<String, dynamic> parsedJson) {
    /* 一、子属性 - 数组 - 轮播图 */
    var list1 = parsedJson['slides'] as List;
    List<SwiperData> swiperData = list1.map((i) => SwiperData.fromJson(i)).toList();

    /* 二、子属性 - 数组 - 顶部导航 */
    var list2 = parsedJson['category'] as List;
    List<NavigatorData> navigatorData = list2.map((i) => NavigatorData.fromJson(i)).toList();

    return HomeData( 
      slides: swiperData,
      category: navigatorData
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

/*  二、顶部导航 */
class NavigatorData {
  final String mallCategoryName;
  final String image;
  
  NavigatorData({
    this.mallCategoryName,
    this.image
  });

  factory NavigatorData.fromJson(Map<String, dynamic> parseJson) {
    return NavigatorData(
      mallCategoryName: parseJson['mallCategoryName'],
      image: parseJson['image'],
    );
  }
}
