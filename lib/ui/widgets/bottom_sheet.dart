import 'package:flutter/material.dart';
import 'package:flutter_wallpapers/data/network/response/photo_res.dart';

// BOTTOM SHEET IN HOME FEED
Widget infoBottomSheet() {
  return Container(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.all(16),
    height: 250,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "INSPIRED",
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 1.0),
        ),
        const SizedBox(height: 4),
        const Text(
          "Version 1.0.0 by Quang Do - Flutter 15",
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.normal,
              fontSize: 12,
              letterSpacing: 1.0),
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 1),
        GestureDetector(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 44,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: Row(
              children: const [
                Icon(Icons.add, size: 24),
                SizedBox(width: 14),
                Text(
                  "Add account",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
        GestureDetector(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 44,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: Row(
              children: const [
                Icon(Icons.settings, size: 24),
                SizedBox(width: 14),
                Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
        GestureDetector(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 44,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: Row(
              children: const [
                Icon(Icons.info_outline, size: 24),
                SizedBox(width: 14),
                Text(
                  "About us",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
      ],
    ),
  );
}

//BOTTOM SHEET IN PHOTO DETAIL--------------------------------------
Widget photoInfoBottomSheet(Photo photo) {
  return Container(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
    height: 136,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 44,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: Row(
              children: const [
                Icon(Icons.phonelink_setup, size: 24),
                SizedBox(width: 14),
                Text(
                  "Set as Wallpapers",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          onTap: () {

          },
        ),
        GestureDetector(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 44,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: Row(
              children: const [
                Icon(Icons.report_problem, size: 24),
                SizedBox(width: 14),
                Text(
                  "Reports",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          onTap: () {
            _onReports();
          },
        )
      ],
    ),
  );
}

void _onReports() {}

//BOTTOM SHEET IN STORAGE--------------------------------------
Widget newAlbumBottomSheet() {
  return Container();
}
