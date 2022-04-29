import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;

  const ScrollToHideWidget(
      {Key? key,
      required this.child,
      required this.controller,
      this.duration = const Duration(milliseconds: 250)})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    widget.controller.addListener(listen);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? kBottomNavigationBarHeight : 0,
      child: Stack(
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
              child: Container(),
            ),
          ),
          Wrap(
            children: [widget.child],
          ),
        ],
      ));

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  void show() {
    if (!isVisible) setState(() => isVisible = true);
  }

  void hide() {
    if (isVisible) setState(() => isVisible = false);
  }
}

int _selectedIndex = 0;

// BackdropFilter(
// filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
// child: Container(
// height: 100,
// width: 100,
// decoration: BoxDecoration(color: Colors.black.withOpacity(1.0)),
// ),
// ),

Widget homeNavBar(ScrollController scrollController) {
  return ScrollToHideWidget(
    controller: scrollController,
    child: BottomNavigationBar(
      currentIndex: _selectedIndex,
      showSelectedLabels: false,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Feed",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.storage),
          label: "Collection",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_outline_sharp),
          label: "Saved",
        ),
      ],
      onTap: _onItemTapped,
      backgroundColor: Colors.black54,
    ),
  );
}

void _onItemTapped(int index) {
  // setState(() {
  //   _selectedIndex = index;
  // });
}
