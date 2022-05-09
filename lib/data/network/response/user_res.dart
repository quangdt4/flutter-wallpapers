class User {
  String? id;
  String? updatedAt;
  String? username;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  int? totalLikes;
  int? totalPhotos;
  int? totalCollections;
  bool? followedByUser;
  int? downloads;
  int? uploadsRemaining;
  String? instagramUsername;
  String? email;

  User(
      {this.id,
        this.updatedAt,
        this.username,
        this.firstName,
        this.lastName,
        this.twitterUsername,
        this.portfolioUrl,
        this.bio,
        this.location,
        this.totalLikes,
        this.totalPhotos,
        this.totalCollections,
        this.followedByUser,
        this.downloads,
        this.uploadsRemaining,
        this.instagramUsername,
        this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    totalCollections = json['total_collections'];
    followedByUser = json['followed_by_user'];
    downloads = json['downloads'];
    uploadsRemaining = json['uploads_remaining'];
    instagramUsername = json['instagram_username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['updated_at'] = updatedAt;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['twitter_username'] = twitterUsername;
    data['portfolio_url'] = portfolioUrl;
    data['bio'] = bio;
    data['location'] = location;
    data['total_likes'] = totalLikes;
    data['total_photos'] = totalPhotos;
    data['total_collections'] = totalCollections;
    data['followed_by_user'] = followedByUser;
    data['downloads'] = downloads;
    data['uploads_remaining'] = uploadsRemaining;
    data['instagram_username'] = instagramUsername;
    data['email'] = email;
    return data;
  }
}

