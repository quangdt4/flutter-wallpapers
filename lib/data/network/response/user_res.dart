import 'package:flutter_wallpapers/data/network/response/profile_image_res.dart';

import 'links_res.dart';

class User {
  String? id;
  String? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? instagramUsername;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  int? totalLikes;
  int? totalPhotos;
  int? totalCollections;
  bool? followedByUser;
  int? followersCount;
  int? followingCount;
  int? downloads;
  ProfileImage? profileImage;
  Links? links;

  User(
      {this.id,
      this.updatedAt,
      this.username,
      this.name,
      this.firstName,
      this.lastName,
      this.instagramUsername,
      this.twitterUsername,
      this.portfolioUrl,
      this.bio,
      this.location,
      this.totalLikes,
      this.totalPhotos,
      this.totalCollections,
      this.followedByUser,
      this.followersCount,
      this.followingCount,
      this.downloads,
      this.profileImage,
      this.links});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    instagramUsername = json['instagram_username'];
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    totalCollections = json['total_collections'];
    followedByUser = json['followed_by_user'];
    followersCount = json['followers_count'];
    followingCount = json['following_count'];
    downloads = json['downloads'];
    profileImage = json['profile_image'] != null
        ? ProfileImage.fromJson(json['profile_image'])
        : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['updated_at'] = updatedAt;
    data['username'] = username;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['instagram_username'] = instagramUsername;
    data['twitter_username'] = twitterUsername;
    data['portfolio_url'] = portfolioUrl;
    data['bio'] = bio;
    data['location'] = location;
    data['total_likes'] = totalLikes;
    data['total_photos'] = totalPhotos;
    data['total_collections'] = totalCollections;
    data['followed_by_user'] = followedByUser;
    data['followers_count'] = followersCount;
    data['following_count'] = followingCount;
    data['downloads'] = downloads;
    if (profileImage != null) {
      data['profile_image'] = profileImage!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }
}
