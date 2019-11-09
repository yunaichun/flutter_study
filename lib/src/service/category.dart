import './http.dart';
// 正式环境
import '../config/prd.dart';
// 测试环境
import '../config/dev.dart';

// 获取分类数据 - 正式环境
getCategory({ formData }) {
  return post(servicePath['getCategory'], formData: formData);
}

// 获取分类数据 - 测试环境
getCategoryDEV({ queryData }) {
  return get(servicePathDEV['getCategory'], queryData: queryData);
}
