import 'package:flutter_bili_app/model/video_model.dart';

class RankingMo {
  int total;
  List<VideoModel> list;
  RankingMo({this.total, this.list});

  RankingMo.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['list'] != null) {
      list = new List<VideoModel>.empty(growable: true);
      json['list'].forEach((v) {
        list.add(new VideoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
