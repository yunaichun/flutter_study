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
  final List<RecommendData> recommend;
  final FloorPicData floor1Pic;
  final List<FloorData> floor1;
  final FloorPicData floor2Pic;
  final List<FloorData> floor2;
  final FloorPicData floor3Pic;
  final List<FloorData> floor3;

  HomeData({
    this.slides,
    this.category,
    this.advertesPicture,
    this.shopInfo,
    this.recommend,
    this.floor1Pic,
    this.floor1,
    this.floor2Pic,
    this.floor2,
    this.floor3Pic,
    this.floor3,
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

    /* 五、子属性 - 数组 - 商品推荐 */
    var list3 = parsedJson['recommend'] as List;
    List<RecommendData> recommendData = list3.map((i) => RecommendData.fromJson(i)).toList();
    
    /* 六、子属性 - 对象 + 数组 - 楼层 */
    var floor1PicData = FloorPicData.fromJson(parsedJson['floor1Pic']);
    var list4 = parsedJson['floor1'] as List;
    List<FloorData> floor1Data = list4.map((i) => FloorData.fromJson(i)).toList();
    var floor2PicData = FloorPicData.fromJson(parsedJson['floor2Pic']);
    var list5 = parsedJson['floor2'] as List;
    List<FloorData> floor2Data = list5.map((i) => FloorData.fromJson(i)).toList();
    var floor3PicData = FloorPicData.fromJson(parsedJson['floor3Pic']);
    var list6 = parsedJson['floor3'] as List;
    List<FloorData> floor3Data = list6.map((i) => FloorData.fromJson(i)).toList();
    return HomeData( 
      slides: swiperData,
      category: navigatorData,
      advertesPicture: bannerData,
      shopInfo: telephoneData,
      recommend: recommendData,
      floor1Pic: floor1PicData,
      floor1: floor1Data,
      floor2Pic: floor2PicData,
      floor2: floor2Data,
      floor3Pic: floor3PicData,
      floor3: floor3Data
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

/*  五、商品推荐 */
class RecommendData {
  final String goodsName;
  final String image;
  final int mallPrice;
  final int price;

  RecommendData({
    this.goodsName,
    this.image,
    this.mallPrice,
    this.price
  });

  factory RecommendData.fromJson(Map<String, dynamic> parsedJson) {
    return RecommendData(
      goodsName: parsedJson['goodsName'],
      image: parsedJson['image'],
      mallPrice: parsedJson['mallPrice'],
      price: parsedJson['price']
    );
  }
}

/*  六、楼层数据 */
class FloorPicData {
  final String PICTURE_ADDRESS;

  FloorPicData({
    this.PICTURE_ADDRESS
  });

  factory FloorPicData.fromJson(Map<String, dynamic> parsedJson){
    return FloorPicData(
      PICTURE_ADDRESS: parsedJson['PICTURE_ADDRESS']
    );
  }
}
class FloorData {
  final String image;

  FloorData({
    this.image
  });

  factory FloorData.fromJson(Map<String, dynamic> parsedJson){
    return FloorData(
      image: parsedJson['image']
    );
  }
}