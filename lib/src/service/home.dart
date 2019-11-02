import './http.dart';
// 正式环境
import '../config/prd.dart';
// 测试环境
import '../config/dev.dart';

// 获取首页数据 - 正式环境
gethomePageContext({ formData }) {
  return post(servicePath['homePageContext'], formData: formData);
}

// 获取首页下拉刷新数据 - 正式环境
gethomePageBelowConten({ formData }) {
  return post(servicePath['homePageBelowConten'], formData: formData);
}

// 获取首页数据 - 测试环境
gethomePageContextDEV({ queryData }) {
  return get(servicePathDEV['homePageContext'], queryData: queryData);
}

// 获取首页下拉刷新数据 - 测试环境
gethomePageBelowContenDEV({ queryData }) {
  return get(servicePathDEV['homePageBelowConten'], queryData: queryData);
}