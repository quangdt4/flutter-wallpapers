import 'package:flutter/material.dart';

import '../../data/network/response/photo_res.dart';
import '../detail/detail.dart';

Widget photoItem(BuildContext context, Photo item, List<Photo> listPhotoSug) {
  return GestureDetector(
    child: Image.network(
      item.urls?.regular ?? "",
      fit: BoxFit.cover,
    ),
    onTap: () {
      _onItemPressed(context, item, listPhotoSug);
    },
    onLongPress: () {},
  );
}

void _onItemPressed(
    BuildContext context, Photo photo, List<Photo> listPhotoSug) async {
  await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              DetailScreen(photo: photo, listSuggest: listPhotoSug)));
}
