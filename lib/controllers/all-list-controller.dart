import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/const/api-end-points.dart';
import 'package:netflix_clone/models/movie.dart';

class AllListController extends GetxController {
  var isLoading = false.obs;
  var isSearchLoading = false.obs;
  var searchComp = false.obs;
  List<Movie> movies = <Movie>[].obs;
  List<Movie> searchList = <Movie>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.parse("${getMovies}all"));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponce = jsonDecode(response.body);
        movies = jsonResponce.map((e) => Movie.fromJson(e['show'])).toList();
        debugPrint(
            "Api Called---------------------------------------------------------");
      } else {
        debugPrint("Error while fetching Data from url");
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }

  fetchwithSearch(String search) async {
    try {
      isSearchLoading(true);
      searchComp(true);
      if (search.isEmpty) {
        searchComp(false);
      } else {
        http.Response response = await http.get(Uri.parse(getMovies + search));
        if (response.statusCode == 200) {
          List<dynamic> jsonResponce = jsonDecode(response.body);
          searchList =
              jsonResponce.map((e) => Movie.fromJson(e['show'])).toList();
          debugPrint(
              "Search Api Called------------${searchList.length}----------------");
        } else {
          debugPrint("Error while fetching Data from url");
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isSearchLoading(false);
    }
  }
}
