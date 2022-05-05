import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wallpapers/res/colors.dart';
import 'package:flutter_wallpapers/res/constants.dart';
import 'package:flutter_wallpapers/res/fonts.dart';
import 'package:flutter_wallpapers/routes/routes.dart';
import 'package:flutter_wallpapers/states/photos/photo_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider<PhotoBloc>(create: (context) => PhotoBloc())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      color: Colors.white,
      title: 'Flutter Wallpapers',
      theme: ThemeData(
          fontFamily: AppFonts.manrope,
          textTheme: theme.textTheme.apply(
              fontFamily: AppFonts.manrope, displayColor: AppColors.black),
          scaffoldBackgroundColor: AppColors.lightGrey,
          primaryColor: Colors.white,
          canvasColor: Colors.black.withOpacity(0.5)),
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navKey,
      onGenerateRoute: AppNavigator.generateRoute,
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();

        final data = MediaQuery.of(context);
        final smallestSize = min(data.size.width, data.size.height);
        final textScaleFactor =
            min(smallestSize / AppConstants.designScreenSize.width, 1.0);

        return MediaQuery(
          data: data.copyWith(
            textScaleFactor: textScaleFactor,
          ),
          child: child,
        );
      },
    );
  }
}
