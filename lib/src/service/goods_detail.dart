import './http.dart';
// 正式环境
import '../config/prd.dart';
// 测试环境
import '../config/dev.dart';

// 获取分类数据 - 正式环境
getGoodsDetail({ formData }) {
  return post(servicePath['getGoodDetailById'], formData: formData);
}

// 获取分类数据 - 测试环境
getGoodsDetailDEV({ queryData }) {
  return get(servicePathDEV['getGoodDetailById'], queryData: queryData);
}
