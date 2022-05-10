import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../data/network/response/photo_res.dart';
import '../../../routes/routes.dart';
import '../../../states/photos/photo_bloc.dart';
import '../../../states/photos/photo_state.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({Key? key, required this.scrollController}) : super(key: key);

  final ScrollController scrollController;

  @override
  State<StatefulWidget> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
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
    return Center(
      child: BlocSelector<PhotoBloc, PhotoState, List<Photo>>(
          selector: (state) => state.listPhoto,
          builder: (_, listPhoto) {
            return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              mainAxisSpacing: 1.5,
              crossAxisSpacing: 1.5,
              controller: widget.scrollController,
              itemCount: listPhoto.length,
              itemBuilder: (context, index) {
                Photo item = listPhoto[index];
                return FadeInUp(
                  delay: Duration(milliseconds: index * 50),
                  duration: Duration(milliseconds: (index * 50) + 500),
                  child: photoItem(context, item),
                );
              },
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 4 : 2),
            );
          }),
    );
  }
}

Widget photoItem(BuildContext context, Photo item) {
  return GestureDetector(
    child: Container(
      color: Colors.black,
      child: Image.network(
        item.urls?.thumb ?? "",
        fit: BoxFit.cover,
      ),
    ),
    onTap: () {
      _onItemPress(item);
    },
    onLongPress: () {},
  );
}

void _onItemPress(Photo photo) {
  AppNavigator.push(Routes.detail, photo);
}
