import '../network/response/photo_res.dart';

List<Albums> storage = [
  Albums(0, "Add new", []),
  Albums(1, "Downloaded", []),
  Albums(2, "City Skylines", []),
  Albums(3, "Chelsea", []),
];

class Albums {
  int id;
  String title;
  List<Photo> yourAlbums = [];

  Albums(this.id, this.title, this.yourAlbums);
}
