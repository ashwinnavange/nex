import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nex/screens/bottom_navi.dart';
import 'package:nex/screens/home_screen.dart';
import 'package:nex/screens/search_screen.dart';
import 'package:nex/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black38,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black38),
        canvasColor: Colors.black,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/bottomNavigation', page: () => BottomNavigation()),
        GetPage(name: '/homeScreen', page: () => HomeScreen()),
        GetPage(name: '/searchScreen', page: () => SearchScreen()),
      ],
    );
  }
}
