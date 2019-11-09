class Shape{
  // 基本类型
  String shapeName;
  // 对象
  Property property;
  // 数组
  List<Image> images;

  Shape({
    this.shapeName,
    this.property,
    this.images
  });
  // 键：String，值：动态类型
  factory Shape.fromJson(Map<String, dynamic> parsedJson) {
    // 对象处理
    var propertyObj = Property.fromJson(parsedJson['property']);
    // 数组处理
    var list = parsedJson['images'] as List;
    List<Image> imagesList = list.map((i) => Image.fromJson(i)).toList();

    return Shape(
      shapeName: parsedJson['shape_name'],
      property : propertyObj,
      images: imagesList
    );
  }
}

class Property{
  double width;
  double breadth;

  Property({
    this.width,
    this.breadth
  });
  // 键：String，值：动态类型
  factory Property.fromJson(Map<String, dynamic> json){
    return Property(
      width: json['width'],
      breadth: json['breadth']
    );
  }
}

class Image {
  final int imageId;
  final String imageName;

  Image({this.imageId, this.imageName});
  // 键：String，值：动态类型
  factory Image.fromJson(Map<String, dynamic> parsedJson){
    return Image(
      imageId: parsedJson['imageId'],
      imageName: parsedJson['imageName']
    );
  }
}

var shape = {
  "shape_name":"rectangle",
  "property":{
    "width":5.0,
    "breadth":10.0
  },
  "images": [{
    "imageId": 1,
    // "imageName": '2'
  }]
};
void main() {
  Shape shape1 = new Shape.fromJson(shape);
  print(shape1.images[0].imageId);
}
