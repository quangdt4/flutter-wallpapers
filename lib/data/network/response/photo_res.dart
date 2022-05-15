import 'package:flutter_wallpapers/data/network/response/sponsorship_res.dart';
import 'package:flutter_wallpapers/data/network/response/urls_res.dart';
import 'package:flutter_wallpapers/data/network/response/user_res.dart';

import 'links_res.dart';

class PhotoListResponse {
  final List<Photo> results;

  PhotoListResponse(this.results);

  PhotoListResponse.fromJsonArray(List json)
      : results = json.map((i) => Photo.fromJson(i)).toList();
}

class Photo {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? color;
  String? altDescription;
  bool? likedByUser;
  int? width;
  int? height;
  int? likes;
  Links? links;
  Sponsorship? sponsorship;
  Urls? urls;
  User? user;
  bool isLocalSaved = false;

  Photo(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.color,
      this.altDescription,
      this.likedByUser,
      this.width,
      this.height,
      this.likes,
      this.links,
      this.sponsorship,
      this.urls,
      this.user,
      required this.isLocalSaved});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    color = json['color'];
    altDescription = json['alt_description'];
    likedByUser = json['liked_by_user'];
    width = json['width'];
    height = json['height'];
    likes = json['likes'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    sponsorship = json['sponsorship'] != null
        ? Sponsorship.fromJson(json['sponsorship'])
        : null;
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['color'] = color;
    data['alt_description'] = altDescription;
    data['liked_by_user'] = likedByUser;
    data['width'] = width;
    data['height'] = height;
    data['likes'] = likes;
    if (links != null) {
      data['links'] = links?.toJson();
    }
    if (sponsorship != null) {
      data['sponsorship'] = sponsorship?.toJson();
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
