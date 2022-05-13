import 'package:flutter/material.dart';

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
