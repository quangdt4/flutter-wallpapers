import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../data/model/storage.dart';
import '../../../data/network/response/collection_item_res.dart';
import '../../../res/colors.dart';
import '../../../states/collections/collections_bloc.dart';
import '../../../states/collections/collections_state.dart';
import '../../widgets/bottom_sheet.dart';

class TabStorage extends StatefulWidget {
  const TabStorage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabStorageState();
}

class _TabStorageState extends State<TabStorage> {
  CollectionsBloc get collectionsBloc => context.read<CollectionsBloc>();

  @override
  void initState() {
    // collectionsBloc.add(GetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: BlocSelector<CollectionsBloc, CollectionsState, List<Collection>>(
      //     selector: (state) => state.listCollection,
      //     builder: (_, listCollection) {
      //       return
      //     }),
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(children: [
          const SizedBox(height: 12),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Storage",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(height: 12),
          _listCollection(storage)
        ]),
      ),
    );
  }

  Widget _listCollection(List<Albums> storage) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: storage.length,
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 2),
        itemBuilder: (context, index) {
          Albums albums = storage[index];
          return FadeInUp(
            delay: Duration(milliseconds: index * 50),
            duration: Duration(milliseconds: (index * 50) + 800),
            child: _collectionItem(context, albums),
          );
        },
      ),
    );
  }

  Widget _collectionItem(BuildContext context, Albums albums) {
    if (albums.id == 0) {
      return GestureDetector(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(decoration: const BoxDecoration(color: Colors.grey)),
              const Center(
                child: Icon(Icons.add, size: 60, color: Colors.white),
              ),
            ],
          ),
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return newAlbumBottomSheet();
                });
          });
    } else {
      return GestureDetector(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                  "https://images.unsplash.com/photo-1652457988479-ff393bc55e72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                  fit: BoxFit.cover),
              Container(
                decoration: const BoxDecoration(color: AppColors.black60),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    albums.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              IconButton(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topRight,
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 20,
                    color: Colors.white,
                  ),
                  onPressed: () {})
            ],
          ),
          onTap: () {
            _onItemPressed(albums);
          });
    }
  }

  void _onItemPressed(Albums albums) async {
    // await Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => DetailCollection(collectionItem: item)));
  }
}
