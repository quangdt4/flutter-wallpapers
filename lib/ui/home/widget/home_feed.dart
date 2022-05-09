import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../data/network/response/photo_res.dart';
import '../../../routes/routes.dart';

Widget homeFeed(BuildContext context, ScrollController _scrollController,
    List<Photo> listPhoto) {
  return Center(
    child: StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      mainAxisSpacing: 1.5,
      crossAxisSpacing: 1.5,
      controller: _scrollController,
      itemCount: listPhoto.length,
      itemBuilder: (context, index) {
        return FadeInUp(
          delay: Duration(milliseconds: index * 50),
          duration: Duration(milliseconds: (index * 50) + 500),
          child: photoItem(context, listPhoto[index]),
        );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 4 : 2),
    ),
  );
}

Widget photoItem(BuildContext context, Photo photo) {
  return GestureDetector(
    child: Container(
      color: Colors.black,
      child: Image.network(
        photo.urls?.thumb ?? "",
        fit: BoxFit.cover,
      ),
    ),
    onTap: () {
      _onItemPress(photo);
    },
    onLongPress: () {},
  );
}

void _onItemPress(Photo photo) {
  // pokemonBloc.add(PokemonSelectChanged(pokemonId: pokemon.number));

  AppNavigator.push(Routes.detail, photo);
}
