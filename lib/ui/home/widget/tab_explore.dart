import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_wallpapers/data/network/response/collection_item_res.dart';
import 'package:flutter_wallpapers/res/colors.dart';
import 'package:flutter_wallpapers/routes/routes.dart';
import 'package:flutter_wallpapers/states/collections/collections_bloc.dart';
import 'package:flutter_wallpapers/states/collections/collections_event.dart';
import 'package:flutter_wallpapers/states/collections/collections_state.dart';

import '../../detail/collection_detail.dart';

class TabExplore extends StatefulWidget {
  const TabExplore({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabExploreState();
}

class _TabExploreState extends State<TabExplore> {
  CollectionsBloc get collectionsBloc => context.read<CollectionsBloc>();

  @override
  void initState() {
    collectionsBloc.add(GetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocSelector<CollectionsBloc, CollectionsState, List<Collection>>(
          selector: (state) => state.listCollection,
          builder: (_, listCollection) {
            return Container(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(children: [
                const SizedBox(height: 12),
                _searchBar(screenWidth),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Collections",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _listCollection(listCollection)
              ]),
            );
          }),
    );
  }

  Widget _searchBar(double screenWidth) {
    return GestureDetector(
      child: Container(
          width: screenWidth,
          padding: const EdgeInsets.only(left: 10, right: 10),
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10)),
          child: Align(
            alignment: Alignment.center,
            child: Row(
              children: const [
                Icon(
                  Icons.search_sharp,
                  color: Colors.grey,
                  size: 24,
                ),
                SizedBox(width: 10),
                Text(
                  "Search photos, collection,..",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          )),
      onTap: () {
        AppNavigator.push(Routes.search);
      },
    );
  }

  Widget _listCollection(List<Collection> listCollection) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: listCollection.length,
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 2),
        itemBuilder: (context, index) {
          Collection item = listCollection[index];
          return FadeInUp(
            delay: Duration(milliseconds: index * 50),
            duration: Duration(milliseconds: (index * 50) + 800),
            child: _collectionItem(context, item),
          );
        },
      ),
    );
  }

  Widget _collectionItem(BuildContext context, Collection item) {
    return GestureDetector(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(item.coverPhoto?.urls?.regular ?? "",
                fit: BoxFit.cover),
            Container(
              decoration: const BoxDecoration(color: AppColors.black60),
            ),
            Center(
              child: Text(
                item.title ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          _onItemPressed(item);
        });
  }

  void _onItemPressed(Collection item) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailCollection(collectionItem: item)));
  }
}
