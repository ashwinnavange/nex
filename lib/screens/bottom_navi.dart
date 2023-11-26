import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nex/controllers/bottom_nav_controller.dart';
import 'package:nex/screens/home_screen.dart';
import 'package:nex/screens/search_screen.dart';

class BottomNavigation extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  BottomNavigation({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        int _page = controller.pageIndex.value;

        return IndexedStack(
          index: _page,
          children: [
            HomeScreen(),
            SearchScreen(),
          ],  
        );
      }),
      bottomNavigationBar: Obx(() {
        int page = controller.pageIndex.value;
        return BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
          backgroundColor: Colors.black,
          currentIndex: page,
          elevation: 0,
          iconSize: 25,
          selectedFontSize: 10,
          unselectedFontSize: 8,
          onTap: (index) => controller.changePage(index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
        );
      }),
    );
  }
}
