class GoodsDetailResponse {
  final String code;
  final String message;
  final GoodsDetailData data;

  GoodsDetailResponse({
    this.code,
    this.message,
    this.data
  });

  factory GoodsDetailResponse.fromJson(Map<String, dynamic> parsedJson) {

    var goodsDetailDataObj = GoodsDetailData.fromJson(parsedJson['data']);

    return GoodsDetailResponse(
      code: parsedJson['code'],
      message: parsedJson['message'],
      data: goodsDetailDataObj
    );
  }
}

// 对象
class GoodsDetailData {
  final GoodInfo goodInfo;
  List goodComments;
  final AdvertesPicture advertesPicture;

  GoodsDetailData({
    this.goodInfo,
    this.goodComments,
    this.advertesPicture
  });

  factory GoodsDetailData.fromJson(Map<String, dynamic> parsedJson) {

    // 子属性 - 对象
    var goodInfoObj = GoodInfo.fromJson(parsedJson['goodInfo']);
    // 子属性 - 对象
    var advertesPictureObj = AdvertesPicture.fromJson(parsedJson['advertesPicture']);
    
    return GoodsDetailData(
      goodInfo: goodInfoObj,
      goodComments: parsedJson['goodComments'],
      advertesPicture: advertesPictureObj
    );
  }
}

// 对象
class GoodInfo {
  final String goodsName;
  final String goodsId;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final String image5;
  final String goodsDetail;
  final String goodsSerialNumber;
  final String isOnline;
  final String comPic;
  final String shopId;
  final int amount;
  final int state;
  final double oriPrice;
  final double presentPrice;

  GoodInfo({
    this.goodsName,
    this.goodsId,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.image5,
    this.goodsDetail,
    this.goodsSerialNumber,
    this.isOnline,
    this.comPic,
    this.shopId,
    this.amount,
    this.state,
    this.oriPrice,
    this.presentPrice
  });

  factory GoodInfo.fromJson(Map<String, dynamic> parsedJson) {

    return GoodInfo(
      goodsName: parsedJson['goodsName'],
      goodsId: parsedJson['goodsId'],
      image1: parsedJson['image1'],
      image2: parsedJson['image2'],
      image3: parsedJson['image3'],
      image4: parsedJson['image4'],
      image5: parsedJson['image5'],
      goodsDetail: parsedJson['goodsDetail'],
      goodsSerialNumber: parsedJson['goodsSerialNumber'],
      isOnline: parsedJson['isOnline'],
      comPic: parsedJson['comPic'],
      shopId: parsedJson['shopId'],
      amount: parsedJson['amount'],
      state: parsedJson['state'],
      oriPrice: parsedJson['oriPrice'],
      presentPrice: parsedJson['presentPrice']
    );
  }
}

// 对象
class AdvertesPicture {
  final String PICTURE_ADDRESS;
  final String TO_PLACE;
  final int urlType;

  AdvertesPicture({
    this.PICTURE_ADDRESS,
    this.TO_PLACE,
    this.urlType
  });

  factory AdvertesPicture.fromJson(Map<String, dynamic> parsedJson) {

    return AdvertesPicture(
      PICTURE_ADDRESS: parsedJson['PICTURE_ADDRESS'],
      TO_PLACE: parsedJson['TO_PLACE'],
      urlType: parsedJson['urlType']
    );
  }
}
