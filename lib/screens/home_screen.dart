import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:nex/controllers/home_controller.dart';
import 'package:nex/screens/detail_screen.dart';

class HomeScreen extends GetWidget<HomeController> {
  static String routeName = '/homeScreen';
  @override
  final HomeController controller = Get.put(HomeController());
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo.png'),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/searchScreen'),
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 550,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.5,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: controller.movieList.sublist(1, 6).map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () => Get.to(
                                () => DetailScreen(movie: i),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  image: DecorationImage(
                                    image: NetworkImage(i.show.image!.original),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Column(
                          children: [
                            Icon(Icons.add),
                            Text(
                              'My List',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        NeoPopButton(
                          color: Colors.white,
                          onTapUp: () => HapticFeedback.vibrate(),
                          onTapDown: () => HapticFeedback.vibrate(),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                                Text(
                                  ' Play',
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Column(
                          children: [
                            Icon(Icons.info_outline),
                            Text(
                              'info',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Popular on Nex',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.movieList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Get.to(
                              () => DetailScreen(
                                  movie: controller.movieList[index]),
                            ),
                            child: Column(
                              children: [
                                controller.movieList[index].show.image != null
                                    ? Container(
                                        height: 250,
                                        width: 150,
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade800,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              controller.movieList[index].show
                                                  .image!.original,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      )
                                    : Container(
                                        height: 250,
                                        width: 150,
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade800,
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/app_icon.png'),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
