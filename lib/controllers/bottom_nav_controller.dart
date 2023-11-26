import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var pageIndex = 0.obs;

  void changePage(int page) {
    pageIndex.value = page;
  }
}
