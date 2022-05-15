import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../data/model/storage.dart';
import '../../data/network/response/photo_res.dart';
import '../../routes/routes.dart';
import '../widgets/photo_item.dart';

class LocalSaveDetail extends StatefulWidget {
  const LocalSaveDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LocalSaveDetailState();
}

class _LocalSaveDetailState extends State<LocalSaveDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _collectionContent(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Saved',
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1.0),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black87,
        ),
        onPressed: () {
          AppNavigator.pop();
        },
      ),
    );
  }

  Widget _collectionContent() {
    return Center(
      child: listLocalSaved.isEmpty
          ? const Text(
              "No Results",
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          : StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              mainAxisSpacing: 1.5,
              crossAxisSpacing: 1.5,
              itemCount: listLocalSaved.length,
              itemBuilder: (context, index) {
                Photo item = listLocalSaved[index];
                List<Photo> listPhotoSug = listLocalSaved;
                return FadeInUp(
                  delay: Duration(milliseconds: index * 50),
                  duration: Duration(milliseconds: (index * 50) + 500),
                  child: photoItem(context, item, listPhotoSug),
                );
              },
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 4 : 2),
            ),
    );
  }
}
