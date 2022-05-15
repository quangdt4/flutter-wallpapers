import '../network/response/photo_res.dart';

List<Albums> storage = [
  Albums(0, "Add new", []),
  Albums(1, "Saved", listLocalSaved),
];

class Albums {
  int id;
  String title;
  List<Photo> yourAlbums = [];

  Albums(this.id, this.title, this.yourAlbums);
}

List<Photo> listLocalSaved = [];
