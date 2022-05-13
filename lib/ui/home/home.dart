import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wallpapers/states/navigation/nav_bloc.dart';
import 'package:flutter_wallpapers/states/navigation/nav_state.dart';
import 'package:flutter_wallpapers/ui/home/widget/tab_profile.dart';
import 'package:flutter_wallpapers/ui/home/widget/tab_explore.dart';
import 'package:flutter_wallpapers/ui/home/widget/tab_storage.dart';
import 'package:flutter_wallpapers/ui/widgets/navigation_bar.dart';
import '../../states/navigation/nav_event.dart';
import 'widget/tab_feed.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: BlocSelector<NavigationBloc, NavigationState, int>(
            selector: (state) => state.selectedItem,
            builder: (_, tabIndex) {
              return _widgetOptions(tabIndex);
            },
          ),
        ),
        bottomNavigationBar: _bottomNavBar(),
        extendBody: true);
  }

  _widgetOptions(int i) {
    switch (i) {
      case 1:
        return const TabExplore();
      case 2:
        return storage();
      case 3:
        return const TabProfile();
      case 0:
      default:
        return TabFeed(
          scrollController: scrollController,
        );
    }
  }

  Widget _bottomNavBar() {
    return BlocSelector<NavigationBloc, NavigationState, int>(
      selector: (state) => state.selectedItem,
      builder: (_, i) {
        return ScrollToHideWidget(
          controller: scrollController,
          child: BottomNavigationBar(
            currentIndex: i,
            showSelectedLabels: false,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view, size: 26),
                  label: "Feed",
                  backgroundColor: Colors.white),
              // can change bottom nav with white70
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 26),
                  label: "Explore",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_outline_sharp, size: 26),
                  label: "Saved",
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined, size: 26),
                  label: "Me",
                  backgroundColor: Colors.white),
            ],
            onTap: _onTabChanged,
          ),
        );
      },
    );
  }

  void _onTabChanged(int index) {
    context.read<NavigationBloc>().add(TabChange(selectedTab: index));
  }
}
