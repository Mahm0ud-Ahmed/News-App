import 'package:flutter/material.dart';
import 'package:flutter_app/screen/home_screen.dart';
import 'package:flutter_app/theme/theme_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screen/splash_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isSeen = prefs.getBool('seen');
  Widget _screen;
  if (isSeen == null || isSeen == false) {
    _screen = new SplashScreen();
  } else {
    _screen = new HomeScreen();
  }
  runApp(NewsApp(_screen));
}

class NewsApp extends StatelessWidget {
  final Widget _screen;
  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeData,
      home: this._screen,
    );
  }
}
