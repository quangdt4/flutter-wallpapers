import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../data/model/storage.dart';
import '../../../res/colors.dart';
import '../../detail/local_save_detail.dart';

class TabStorage extends StatefulWidget {
  const TabStorage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabStorageState();
}

class _TabStorageState extends State<TabStorage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Login first")));
            // showModalBottomSheet(
            //     context: context,
            //     builder: (context) {
            //       return newAlbumBottomSheet();
            //     });
          });
    } else {
      return GestureDetector(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                  albums.yourAlbums.isNotEmpty
                      ? '${albums.yourAlbums.first.urls?.regular}'
                      : "https://i.pinimg.com/originals/ae/8a/c2/ae8ac2fa217d23aadcc913989fcc34a2.png",
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
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
          onTap: () {
            _onItemPressed(albums);
          });
    }
  }

  void _onItemPressed(Albums albums) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LocalSaveDetail()));
  }
}
