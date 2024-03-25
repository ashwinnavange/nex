import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nex/controllers/search_controller.dart';
import 'package:nex/screens/detail_screen.dart';

class SearchScreen extends GetWidget<SearchControl> {
  static String routeName = '/searchScreen';
  @override
  final SearchControl controller = Get.put(SearchControl());
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[800],
                  ),
                  height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.white24),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Search',
                            labelStyle: TextStyle(color: Colors.white24),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          onChanged: (String val) async {
                            await controller.onSearchTextChanged(val);
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.clearSearch();
                          FocusScope.of(context).unfocus();
                        },
                        icon: const Icon(Icons.cancel, color: Colors.white24),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => controller.isLoading.value
                    ? const Center()
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: controller.searchResults.length,
                          itemBuilder: (context, index) {
                            //return SearchTile(movie: controller.searchResults[index]);
                            return GestureDetector(
                              onTap: () => Get.to(
                                () => DetailScreen(
                                    movie: controller.searchResults[index]),
                              ),
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[900],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: controller.searchResults[index].show.image != null
                                          ? Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      controller.searchResults[index].show.image!.medium),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/app_icon.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      controller.searchResults[index].show.name,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
