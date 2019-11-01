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
  final BannerData advertesPicture;
  final TelephoneData shopInfo;

  HomeData({
    this.slides,
    this.category,
    this.advertesPicture,
    this.shopInfo
  });

  factory HomeData.fromJson(Map<String, dynamic> parsedJson) {
    /* 一、子属性 - 数组 - 轮播图 */
    var list1 = parsedJson['slides'] as List;
    List<SwiperData> swiperData = list1.map((i) => SwiperData.fromJson(i)).toList();

    /* 二、子属性 - 数组 - 顶部导航 */
    var list2 = parsedJson['category'] as List;
    List<NavigatorData> navigatorData = list2.map((i) => NavigatorData.fromJson(i)).toList();

    /* 三、子属性 - 对象 - 广告位 */
    var bannerData = BannerData.fromJson(parsedJson['advertesPicture']);

    /* 四、子属性 - 对象 - 电话 */
    var telephoneData = TelephoneData.fromJson(parsedJson['shopInfo']);
    return HomeData( 
      slides: swiperData,
      category: navigatorData,
      advertesPicture: bannerData,
      shopInfo: telephoneData
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

/*  三、广告数据 */
class BannerData {
  final String PICTURE_ADDRESS;

  BannerData({
    this.PICTURE_ADDRESS
  });

  factory BannerData.fromJson(Map<String, dynamic> parsedJson) {
    return BannerData(
      PICTURE_ADDRESS: parsedJson['PICTURE_ADDRESS']
    );
  }
}

/*  四、电话数据 */
class TelephoneData {
  final String leaderPhone;
  final String leaderImage;

  TelephoneData({
    this.leaderPhone,
    this.leaderImage
  });

  factory TelephoneData.fromJson(Map<String, dynamic> parsedJson) {
    return TelephoneData(
      leaderPhone: parsedJson['leaderPhone'],
      leaderImage: parsedJson['leaderImage']
    );
  }
}
