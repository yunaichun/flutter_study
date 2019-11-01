import './http.dart';
import '../config/url.dart';

Map homePageRequest = {
  "gethomePageContext": ({ formData }) {
    return request(servicePath['homePageContext'], formData: formData);
  }
};
