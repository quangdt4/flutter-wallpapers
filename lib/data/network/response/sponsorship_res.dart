import 'sponsor_res.dart';

class Sponsorship {
  String? impressionsId;
  String? tagline;
  Sponsor? sponsor;
  List<String>? impressionUrls;

  Sponsorship(
      {this.impressionsId, this.tagline, this.sponsor, this.impressionUrls});

  Sponsorship.fromJson(Map<String, dynamic> json) {
    impressionsId = json['impressions_id'];
    tagline = json['tagline'];
    sponsor =
        json['sponsor'] != null ? Sponsor.fromJson(json['sponsor']) : null;

    List<dynamic> impressionUrlsList = json['impression_urls'];
    impressionUrls = [];
    impressionUrls?.addAll(impressionUrlsList.map((o) => o.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['impressions_id'] = impressionsId;
    data['tagline'] = tagline;
    if (sponsor != null) {
      data['sponsor'] = sponsor?.toJson();
    }
    data['impression_urls'] = impressionUrls;
    return data;
  }
}
