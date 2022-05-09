import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_wallpapers/res/colors.dart';
import 'package:flutter_wallpapers/routes/routes.dart';
import 'package:flutter_wallpapers/ui/home/widget/home_feed.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

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
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    photoDetail(screenWidth, marginWidget),
                    const SizedBox(height: 120),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        "Other photos",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ]),
                ),
                // SliverPadding(
                //     padding: const EdgeInsets.all(10),
                //     sliver: SliverStaggeredGrid.countBuilder(
                //         crossAxisCount: 4,
                //         mainAxisSpacing: 10,
                //         crossAxisSpacing: 10,
                //         staggeredTileBuilder: (int index) =>
                //             StaggeredTile.count(2, index.isEven ? 4 : 2),
                //         itemBuilder: (context, index) {
                //           return FadeInUp(
                //             delay: Duration(milliseconds: index * 50),
                //             duration:
                //                 Duration(milliseconds: (index * 50) + 800),
                //             child: photoItem(context, "photo"),
                //           );
                //         },
                //         itemCount: 8))
              ],
            ),
          ),
          Positioned(
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
          )
        ],
      ),
    );
  }

  Widget photoDetail(double screenWidth, double marginWidget) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1633287387306-f08b4b3671c6?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
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
          top: 480,
          child: Container(
              margin: EdgeInsets.all(marginWidget),
              padding: const EdgeInsets.all(16),
              width: screenWidth * 0.9,
              color: AppColors.black95,
              child: infoBox()),
        ),
      ],
    );
  }

  Widget infoBox() {
    var _isVisibleDescription = true;
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1633287387306-f08b4b3671c6?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                ),
              ),
              const SizedBox(width: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 170),
                child: const Text(
                  "Do Thanh Quang",
                  style: TextStyle(
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
            child: Column(
              children: const [
                SizedBox(height: 10),
                Text(
                  "A Motorcycle standing alone in the streets of Rhodes City, Greece --------------- https://images.unsplash.com/photo-1633287387306-f08b4b3671c6?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  style: TextStyle(
                    color: AppColors.lightGrey,
                    fontSize: 14,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
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
