import 'package:flutter_wallpapers/data/network/response/urls_res.dart';
import 'package:flutter_wallpapers/data/network/response/user_res.dart';

import 'links_res.dart';

class CoverPhoto {
  String? id;
  String? color;
  String? description;
  bool? likedByUser;
  int? width;
  int? height;
  int? likes;
  Links? links;
  Urls? urls;
  User? user;

  CoverPhoto(
      {this.id,
      this.color,
      this.description,
      this.likedByUser,
      this.width,
      this.height,
      this.likes,
      this.links,
      this.urls,
      this.user});

  CoverPhoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    description = json['description'];
    likedByUser = json['liked_by_user'];
    width = json['width'];
    height = json['height'];
    likes = json['likes'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['color'] = color;
    data['description'] = description;
    data['liked_by_user'] = likedByUser;
    data['width'] = width;
    data['height'] = height;
    data['likes'] = likes;
    if (links != null) {
      data['links'] = links?.toJson();
    }
    if (urls != null) {
      data['urls'] = urls?.toJson();
    }
    if (user != null) {
      data['user'] = user?.toJson();
    }
    return data;
  }
}
