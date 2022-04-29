import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpapers/routes/fade_page_route.dart';
import 'package:flutter_wallpapers/ui/home/home.dart';
import 'package:flutter_wallpapers/ui/screens/splash.dart';

enum Routes { splash, home, collections, explore, photoInfo }

class RoutePaths {
  static const String splash = '/';
  static const String home = '/home';
  static const String collections = '';
  static const String explore = '';
  static const String photoInfo = '';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: RoutePaths.splash,
    Routes.home: RoutePaths.home,
    Routes.collections: RoutePaths.collections,
    Routes.explore: RoutePaths.explore,
    Routes.photoInfo: RoutePaths.photoInfo,
  };

  static String of(Routes routes) => _pathMap[routes] ?? splash;
}

class AppNavigator {

  static GlobalKey<NavigatorState> navKey = GlobalKey();

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return FadeRoute(page: const SplashScreen());

      case RoutePaths.home:
      default:
        return FadeRoute(page: const HomeScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(RoutePaths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(RoutePaths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navKey.currentState;
}