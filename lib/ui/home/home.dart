import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wallpapers/states/navigation/nav_bloc.dart';
import 'package:flutter_wallpapers/states/navigation/nav_state.dart';
import 'package:flutter_wallpapers/ui/home/widget/collections.dart';
import 'package:flutter_wallpapers/ui/home/widget/explore.dart';
import 'package:flutter_wallpapers/ui/home/widget/storage.dart';
import 'package:flutter_wallpapers/ui/widgets/navigation_bar.dart';
import '../../states/navigation/nav_event.dart';
import 'widget/home_feed.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
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
        appBar: homeAppBar(),
        body: Center(
          child: BlocSelector<NavigationBloc, NavigationState, int>(
            selector: (state) => state.selectedItem,
            builder: (_, tabIndex) {
              return _widgetOptions(tabIndex);
            },
          ),
        ),
        bottomNavigationBar: bottomNavBar(),
        extendBody: true);
  }

  _widgetOptions(int i) {
    switch (i) {
      case 1:
        return explore();
      case 2:
        return collections();
      case 3:
        return storage();
      case 0:
      default:
        return HomeFeed(
          scrollController: scrollController,
        );
    }
  }

  AppBar homeAppBar() {
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
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget bottomNavBar() {
    return BlocSelector<NavigationBloc, NavigationState, int>(
      selector: (state) => state.selectedItem,
      builder: (_, i) {
        return ScrollToHideWidget(
          controller: scrollController,
          child: BottomNavigationBar(
            currentIndex: i,
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
            onTap: _onTabChanged,
            backgroundColor: Colors.black54,
          ),
        );
      },
    );
  }

  void _onTabChanged(int index) {
    context.read<NavigationBloc>().add(TabChange(selectedTab: index));
  }
}

// Future _onRefresh() async {
//   pokemonBloc.add(PokemonLoadStarted());
//
//   return pokemonBloc.stream.firstWhere((e) => e.status != PokemonStateStatus.loading);
// }
