import 'package:flutter_bili_app/http/request/hi_base_request.dart';

class NoticeRequest extends HiBaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return '/uapi/notice';
  }
}
