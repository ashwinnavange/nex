import 'dart:convert';
import 'package:get/get.dart';
import 'package:nex/model/model.dart' as model;
import 'package:http/http.dart' as http;

class SearchControl extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList<model.Movie> searchResults = <model.Movie>[].obs;
  void clearSearch() {
    searchResults.clear();
  }
  Future<void> onSearchTextChanged(String query) async {
    isLoading.value = true;
    final res = await http.get(
      Uri.parse('https://api.tvmaze.com/search/shows?q=$query'),
    );
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body.toString());
      searchResults.clear();
      for (Map<String, dynamic> i in data) {
        searchResults.add(model.Movie.fromMap(i));
      }
    }
    isLoading.value = false;
  }
}
