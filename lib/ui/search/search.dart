import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_wallpapers/states/photos/photo_event.dart';
import '../../data/network/response/photo_res.dart';
import '../../routes/routes.dart';
import '../../states/photos/photo_bloc.dart';
import '../../states/photos/photo_state.dart';
import '../detail/collection_detail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  PhotoBloc get photoBloc => context.read<PhotoBloc>();

  @override
  void initState() {
    photoBloc.add(ResetPhotoData());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocSelector<PhotoBloc, PhotoState, List<Photo>>(
            selector: (state) => state.listPhoto,
            builder: (_, listPhoto) {
              return Container(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: Column(children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black87,
                          size: 24,
                        ),
                        onPressed: () {
                          photoBloc.add(ResetPhotoData());
                          AppNavigator.pop();
                        },
                      ),
                      searchBar(),
                      const SizedBox(width: 12),
                    ],
                  ),
                  searchResultContent(listPhoto)
                ]),
              );
            }),
      ),
    );
  }

  Widget searchResultContent(List<Photo> listPhoto) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        mainAxisSpacing: 1.5,
        crossAxisSpacing: 1.5,
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
  }

  Widget searchBar() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10)),
        child: Align(
          alignment: Alignment.center,
          child: TextField(
            cursorColor: Colors.black87,
            cursorWidth: 1,
            autofocus: true,
            maxLines: 1,
            enableSuggestions: false,
            autocorrect: false,
            onSubmitted: (keyWord) {
              onInputListener(keyWord);
            },
            style: const TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            decoration: const InputDecoration.collapsed(
              border: InputBorder.none,
              hintText: 'Search',
            ),
          ),
        ),
      ),
    );
  }

  onInputListener(String keyWord) {
    photoBloc.add(GetDataFromSearch(keyWord));
  }
}
