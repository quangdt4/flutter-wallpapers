import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_wallpapers/res/colors.dart';
import 'package:flutter_wallpapers/routes/routes.dart';

import '../../data/network/response/photo_res.dart';
import '../widgets/photo_item.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.photo, required this.listSuggest})
      : super(key: key);

  final Photo photo;

  final List<Photo> listSuggest;

  @override
  State<StatefulWidget> createState() => _DetailState();
}

class _DetailState extends State<DetailScreen> {
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
    final screenWidth = MediaQuery.of(context).size.width;
    final marginWidget = (screenWidth - screenWidth * 0.9) / 2;
    return Scaffold(
        backgroundColor: Colors.white,
        body: _sliverContent(screenWidth, marginWidget));
  }

  Widget _sliverContent(double screenWidth, double marginWidget) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  _photoDetail(widget.photo, screenWidth, marginWidget),
                  const SizedBox(height: 100),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text(
                      "More photos",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ]),
              ),
              SliverPadding(
                // MORE PHOTOS LIST
                padding: const EdgeInsets.all(10),
                sliver: SliverStaggeredGrid.countBuilder(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(2, index.isEven ? 4 : 2),
                    itemBuilder: (context, index) {
                      return FadeInUp(
                        delay: Duration(milliseconds: index * 50),
                        duration: Duration(milliseconds: (index * 50) + 800),
                        child: photoItem(context, widget.listSuggest[index],
                            widget.listSuggest),
                      );
                    },
                    itemCount: 8),
              )
            ],
          ),
        ),
        _buttonBack(),
      ],
    );
  }

  Widget _photoDetail(Photo photo, double screenWidth, double marginWidget) {
    double ratio = screenWidth / photo.width!;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.network(
          photo.urls?.regular ?? "",
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 40,
          left: 4,
          right: 4,
          child: Row(
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              IconButton(
                icon: const Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {
                  _onSharePressed();
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {
                  _onMorePressed();
                },
              ),
            ],
          ),
        ),
        Positioned(
          top: photo.height! * ratio - 61,
          child: Container(
              margin: EdgeInsets.all(marginWidget),
              padding: const EdgeInsets.all(16),
              width: screenWidth * 0.9,
              color: AppColors.black95,
              child: _infoBox(photo)),
        ),
      ],
    );
  }

  Widget _infoBox(Photo photo) {
    bool _isVisibleDescription;
    if (photo.altDescription == null) {
      _isVisibleDescription = false;
    } else {
      _isVisibleDescription = true;
    }
    return Flexible(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  photo.user?.profileImage?.large ?? "",
                ),
              ),
              const SizedBox(width: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 120),
                child: Text(
                  "${photo.user?.firstName ?? ""} ${photo.user?.lastName ?? ""}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              IconButton(
                icon: const Icon(
                  Icons.download_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
                onPressed: () {
                  _onDownloadPressed();
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.bookmark_outline_sharp,
                  color: Colors.grey,
                  size: 20,
                ),
                onPressed: () {
                  _onSavePressed();
                },
              ),
            ],
          ),
          Visibility(
            visible: _isVisibleDescription,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.topLeft,
              child: Text(
                photo.altDescription ?? "",
                style: const TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 14,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buttonBack() {
    return Positioned(
      top: 40,
      left: 8,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              AppNavigator.pop();
            },
          ),
        ],
      ),
    );
  }

  void _onSavePressed() {}

  void _onDownloadPressed() {}

  void _onSharePressed() {}

  void _onMorePressed() {
    //show bottomSheet options: Report, Set as Wallpaper, Info
  }
}
