import 'package:flutter_wallpapers/data/network/response/photo_res.dart';

class SearchPhotoResponse {
  int? total;
  int? totalPages;
  List<Photo>? results;

  SearchPhotoResponse({this.total, this.totalPages, this.results});

  SearchPhotoResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = <Photo>[];
      json['results'].forEach((v) {
        results!.add(Photo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['total_pages'] = totalPages;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
