import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../data/network/response/photo_res.dart';
import '../../../states/photos/photo_bloc.dart';
import '../../../states/photos/photo_event.dart';
import '../../../states/photos/photo_state.dart';
import '../../widgets/bottom_sheet.dart';
import '../../widgets/photo_item.dart';

class TabFeed extends StatefulWidget {
  const TabFeed({Key? key, required this.scrollController}) : super(key: key);

  final ScrollController scrollController;

  @override
  State<StatefulWidget> createState() => _TabFeedState();
}

class _TabFeedState extends State<TabFeed> {
  PhotoBloc get photoBloc => context.read<PhotoBloc>();

  @override
  void initState() {
    photoBloc.add(GetData());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _homeAppBar(),
      body: Center(child: _feedContent()),
    );
  }

  AppBar _homeAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        "INSPIRED",
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1.0),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.drag_handle, color: Colors.black87),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return infoBottomSheet();
                });
          },
        ),
      ],
    );
  }

  Widget _feedContent() {
    return BlocSelector<PhotoBloc, PhotoState, List<Photo>>(
        selector: (state) => state.listPhoto,
        builder: (_, listPhoto) {
          return RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2));
              _updateData();
            },
            color: Colors.white,
            backgroundColor: Colors.black54,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              mainAxisSpacing: 1.5,
              crossAxisSpacing: 1.5,
              controller: widget.scrollController,
              itemCount: listPhoto.length,
              itemBuilder: (context, index) {
                Photo item = listPhoto[index];
                List<Photo> listPhotoSug = listPhoto;
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
        });
  }

  void _updateData() {}
}
