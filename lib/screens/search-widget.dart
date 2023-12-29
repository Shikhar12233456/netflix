import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/const/default.dart';
import 'package:netflix_clone/controllers/all-list-controller.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/screens/movie-datail-screen.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchConroller = TextEditingController();
  final movieController = Get.put(AllListController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: dbackgroundColor,
        appBar: AppBar(
          backgroundColor: dbackgroundColor,
          title: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10,
              top: 10,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: dfontcolor.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                child: TextField(
                  controller: searchConroller,
                  cursorColor: dfontcolor,
                  style: TextStyle(color: dfontcolor),
                  onSubmitted: (val) {
                    movieController.fetchwithSearch(val);
                  },
                  decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: dfontcolor.withOpacity(0.4)),
                      isCollapsed: true),
                ),
              ),
            ),
          ),
        ),
        body: Obx(() => movieController.isSearchLoading.value
            ? Center(
                child: dLoading(size.height * 0.3, size.width * 0.2),
              )
            : movieController.searchList.isEmpty
                ? movieController.searchComp.value
                    ? dScreenWithCentreText("No Movies Found")
                    : dScreenWithCentreText("Search")
                : ListView.builder(
                    itemCount: movieController.searchList.length,
                    itemBuilder: (context, index) {
                      Movie movie = movieController.searchList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(Detail(movie: movie));
                        },
                        child: searchMovieTile(
                            size.height * 0.15,
                            size.width,
                            movie.image,
                            movie.name,
                            movie.genres,
                            movie.lang,
                            movie.premiered),
                      );
                    })));
  }
}
