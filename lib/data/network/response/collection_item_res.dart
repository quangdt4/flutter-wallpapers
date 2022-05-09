import 'package:flutter_wallpapers/data/network/response/user_res.dart';

import 'cover_photo_res.dart';
import 'links_res.dart';

class CollectionListItem {
  String? title;
  String? description;
  String? publishedAt;
  String? updatedAt;
  String? shareKey;
  bool? private;
  int? id;
  int? totalPhotos;
  CoverPhoto? coverPhoto;
  Links? links;
  User? user;

  CollectionListItem(
      {this.title,
      this.description,
      this.publishedAt,
      this.updatedAt,
      this.shareKey,
      this.private,
      this.id,
      this.totalPhotos,
      this.coverPhoto,
      this.links,
      this.user});

  CollectionListItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    publishedAt = json['published_at'];
    updatedAt = json['updated_at'];
    shareKey = json['share_key'];
    private = json['private'];
    id = json['id'];
    totalPhotos = json['total_photos'];
    coverPhoto = json['cover_photo'] != null
        ? CoverPhoto.fromJson(json['cover_photo'])
        : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['published_at'] = publishedAt;
    data['updated_at'] = updatedAt;
    data['share_key'] = shareKey;
    data['private'] = private;
    data['id'] = id;
    data['total_photos'] = totalPhotos;
    if (coverPhoto != null) {
      data['cover_photo'] = coverPhoto?.toJson();
    }
    if (links != null) {
      data['links'] = links?.toJson();
    }
    if (user != null) {
      data['user'] = user?.toJson();
    }
    return data;
  }
}
