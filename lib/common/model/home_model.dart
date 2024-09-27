import 'package:flutter/material.dart';

class BannerModel<T> {
  String? pic;
  String? title;
  String? author;
  String? create;
  String? coins;

  String? play;
  String? duration;

  BannerModel(
    this.pic,
    this.title,
    this.author,
    this.create,
    this.coins,
    this.play,
    this.duration,
  );

  BannerModel.fromJson(Map<String, dynamic>? json) {
    pic = json?['pic'];
    title = json?['title'];
    author = json?['author'];
    create = json?['create'];
    // coins = json?['coins'];
    // play = json?['play'].toString();
    // duration = json?['duration'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['pic'] = this.pic;
    data['title'] = this.title;
    data['author'] = this.author;
    data['create'] = this.create;
    // data['coins'] = this.coins;
    // data['play'] = this.coins;
    // data['duration'] = this.duration;

    return data;
  }
}

class HomeModel<T> {
  String? pic;
  String? title;
  String? desc;
  String? pubdate;
  String? location;

  Owner? owner;

  HomeModel(
    this.pic,
    this.title,
    this.desc,
    this.pubdate,
    this.location,
    this.owner,
  );

  HomeModel.fromJson(Map<String, dynamic>? json) {
    debugPrint('SwiperModel fromJson --- $json');

    debugPrint('SwiperModel 0000 --- ${json?['pic']}');

    pic = json?['pic'];
    title = json?['title'];
    desc = json?['desc'];
    pubdate = json?['pubdate'];
    location = json?['pub_location'];

    // owner = json?['owner'];
    owner = json?['owner'] != null ? new Owner.fromJson(json?['owner']) : null;

    debugPrint('SwiperModel pic --- ${pic}');
    debugPrint('SwiperModel title --- ${title}');
    debugPrint('SwiperModel desc --- ${desc}');
    debugPrint('SwiperModel pubdate --- ${pubdate}');
    debugPrint('SwiperModel owner --- ${owner}');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['pic'] = this.pic;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['pubdate'] = this.pubdate;
    data['pub_location'] = this.location;
    data['pubdate'] = this.pubdate;
    data['owner'] = this.owner!.toJson();

    return data;
  }
}

class Owner {
  int? mid;
  String? name;
  String? face;

  Owner({this.mid, this.name, this.face});

  Owner.fromJson(Map<String, dynamic> json) {
    mid = json['mid'];
    name = json['name'];
    face = json['face'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mid'] = this.mid;
    data['name'] = this.name;
    data['face'] = this.face;
    return data;
  }
}

class LocationModel {
  String? province;
  String? city;
  String? sp;

  LocationModel({this.province, this.city, this.sp});

  LocationModel.fromJson(Map<String, dynamic> json) {
    province = json['province'];
    city = json['city'];
    sp = json['sp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['province'] = province;
    data['city'] = city;
    data['sp'] = sp;
    return data;
  }
}
