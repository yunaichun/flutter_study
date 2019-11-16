/* 分类页响应 */
class CategoryResponse {
  final String code;
  final String message;
  List<CategoryData> data;

  CategoryResponse({
    this.code,
    this.message,
    this.data
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> parsedJson) {
    // 子属性 - 数组
    var list = parsedJson['data'] as List;
    List<CategoryData> data = list.map((i) => CategoryData.fromJson(i)).toList();
    return CategoryResponse(
      code: parsedJson['code'],
      message: parsedJson['message'],
      data: data
    );
  }
}

/* 首页数据 */
class CategoryData {
  final String mallCategoryId;
  final String mallCategoryName;
  final String image;
  final String comments;
  List<SubCategoryData> bxMallSubDto;

  CategoryData({
    this.mallCategoryId,
    this.mallCategoryName,
    this.image,
    this.comments,
    this.bxMallSubDto
  });

  factory CategoryData.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['bxMallSubDto'] as List;
    List<SubCategoryData> subCategoryData = list.map((i) => SubCategoryData.fromJson(i)).toList();
    return CategoryData(
      mallCategoryId: parsedJson['mallCategoryId'],
      mallCategoryName: parsedJson['mallCategoryName'],
      image: parsedJson['image'],
      comments: parsedJson['comments'],
      bxMallSubDto: subCategoryData
    );
  }
}

class SubCategoryData {
  final String mallSubId;
  final String mallCategoryId;
  final String mallSubName;
  final String comments;

  SubCategoryData({
    this.mallSubId,
    this.mallCategoryId,
    this.mallSubName,
    this.comments,
  });

  factory SubCategoryData.fromJson(Map<String, dynamic> parsedJson) {
    return SubCategoryData(
      mallSubId: parsedJson['mallSubId'],
      mallCategoryId: parsedJson['mallCategoryId'],
      mallSubName: parsedJson['mallSubName'],
      comments: parsedJson['comments'],
    );
  }

  // 这个方法相当重要，可以将一个  Map<String, dynamic> 对象通过 add 添加至 List<CartItem> 中
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = this.mallSubId;
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallSubName'] = this.mallSubName;
    data['comments'] = this.comments;
    return data;
  }
}
