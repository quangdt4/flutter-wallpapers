import 'package:flutter/material.dart';
import 'package:flutter_wallpapers/ui/home/widgets/home_content.dart';
import 'package:flutter_wallpapers/ui/widgets/navigation_bar.dart';

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
        body: contentHome(context, scrollController),
        bottomNavigationBar: homeNavBar(scrollController),
        extendBody: true);
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
}
