import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_wallpapers/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    scheduleMicrotask(() async {
      await Future.delayed(const Duration(milliseconds: 1000));
      await AppNavigator.replaceWith(Routes.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "INSPIRED",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1.0),
            ),
          ],
        ),
      ),
    );
  }
}
