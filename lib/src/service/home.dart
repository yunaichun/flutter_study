import './http.dart';
import '../config/url.dart';

// 获取首页数据
gethomePageContext({ formData }) {
  return request(servicePath['homePageContext'], formData: formData);
}
