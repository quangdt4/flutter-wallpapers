import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../data/model/Images.dart';

// int _currentIndex = 0;

Widget contentHome(BuildContext context, ScrollController _scrollController) {
  return Center(
    child: StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 1.5,
      crossAxisSpacing: 1.5,
      controller: _scrollController,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return FadeInUp(
          delay: Duration(milliseconds: index * 50),
          duration: Duration(milliseconds: (index * 50) + 800),
          child: imageItem(context, index),
        );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 4 : 2),
    ),
  );
}

Widget imageItem(BuildContext context, int index) {
  return GestureDetector(
    child: Container(
      color: Colors.black,
      child: Image.network(
        images[index],
        fit: BoxFit.cover,
      ),
    ),
    onTap: () {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('tap $index')));
    },
    onLongPress: () {},
  );
}
