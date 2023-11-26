import 'dart:convert';
import 'package:get/get.dart';
import 'package:nex/model/model.dart' as model;
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var isLoading = true.obs;
  var movieList = <model.Movie>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      final res = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
      var data = jsonDecode(res.body.toString());
      if (res.statusCode == 200) {
        movieList.clear();
        for (Map<String, dynamic> i in data) {
          movieList.add(model.Movie.fromMap(i));
        }
      } else {
        throw Exception('Error in Getting Data');
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
