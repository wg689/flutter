import 'package:flutter_demo/model/owner.dart';

class TestMo {
  String? id;
  String? vid;
  String? title;
  String? tname;
  String? url;
  String? cover;
  int? pubdate;
  String? desc;
  int? view;
  int? duration;
  Owner? owner;
  int? reply;
  int? favorite;
  int? like;
  int? coin;
  int? share;
  String? createTime;
  int? size;

  TestMo(
      {this.id,
      this.vid,
      this.title,
      this.tname,
      this.url,
      this.cover,
      this.pubdate,
      this.desc,
      this.view,
      this.duration,
      this.owner,
      this.reply,
      this.favorite,
      this.like,
      this.coin,
      this.share,
      this.createTime,
      this.size});

  TestMo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vid = json['vid'];
    title = json['title'];
    tname = json['tname'];
    url = json['url'];
    cover = json['cover'];
    pubdate = json['pubdate'];
    desc = json['desc'];
    view = json['view'];
    duration = json['duration'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    reply = json['reply'];
    favorite = json['favorite'];
    like = json['like'];
    coin = json['coin'];
    share = json['share'];
    createTime = json['createTime'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vid'] = this.vid;
    data['title'] = this.title;
    data['tname'] = this.tname;
    data['url'] = this.url;
    data['cover'] = this.cover;
    data['pubdate'] = this.pubdate;
    data['desc'] = this.desc;
    data['view'] = this.view;
    data['duration'] = this.duration;
    if (this.owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['reply'] = this.reply;
    data['favorite'] = this.favorite;
    data['like'] = this.like;
    data['coin'] = this.coin;
    data['share'] = this.share;
    data['createTime'] = this.createTime;
    data['size'] = this.size;
    return data;
  }
}
