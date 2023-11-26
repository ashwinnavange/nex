import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nex/controllers/splash_controller.dart';
import 'package:nex/screens/bottom_navi.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          if (splashController.isLoading.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/app_icon.png'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Nex by QuadB',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            );
          } else {
            Future.delayed(Duration.zero, () {
              print('Navigating to BottomNavigation');
              Get.off(() => BottomNavigation());
            });
            return Container();
          }
        }),
      ),
    );
  }
}
