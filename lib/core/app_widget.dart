import 'package:nlwflutter/challenge/challenge_page.dart';
import 'package:nlwflutter/core/app_colors.dart';
import 'package:nlwflutter/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:nlwflutter/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
