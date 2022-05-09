import 'package:flutter_wallpapers/data/network/response/profile_image_res.dart';

import 'links_res.dart';

class Sponsor {
  String? id;
  String? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? instagramUsername;
  bool? acceptedTos;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  Links? links;
  ProfileImage? profileImage;

  Sponsor(
      {this.id,
      this.updatedAt,
      this.username,
      this.name,
      this.firstName,
      this.lastName,
      this.twitterUsername,
      this.portfolioUrl,
      this.bio,
      this.instagramUsername,
      this.acceptedTos,
      this.totalCollections,
      this.totalLikes,
      this.totalPhotos,
      this.links,
      this.profileImage});

  Sponsor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    instagramUsername = json['instagram_username'];
    acceptedTos = json['accepted_tos'];
    totalCollections = json['total_collections'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    profileImage = json['profile_image'] != null
        ? ProfileImage.fromJson(json['profile_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['updated_at'] = updatedAt;
    data['username'] = username;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['twitter_username'] = twitterUsername;
    data['portfolio_url'] = portfolioUrl;
    data['bio'] = bio;
    data['instagram_username'] = instagramUsername;
    data['accepted_tos'] = acceptedTos;
    data['total_collections'] = totalCollections;
    data['total_likes'] = totalLikes;
    data['total_photos'] = totalPhotos;
    if (links != null) {
      data['links'] = links?.toJson();
    }
    if (profileImage != null) {
      data['profile_image'] = profileImage?.toJson();
    }
    return data;
  }
}
