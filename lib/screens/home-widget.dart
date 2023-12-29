import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/const/default.dart';
import 'package:netflix_clone/controllers/all-list-controller.dart';
import 'package:netflix_clone/controllers/bottom-nav-bar-controller.dart';
import 'package:netflix_clone/screens/movie-datail-screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final allListController = Get.put(AllListController(), permanent: false);
  final bottomNavBarController =
      Get.put(BottomNavBarController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_sharp,
                size: 30,
                color: dfontcolor,
              )),
          title: SizedBox(
            height: 100,
            width: MediaQuery.sizeOf(context).width * 0.7,
            child: Image.asset('assets/images/netflix.png'),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  bottomNavBarController.changeValue(1);
                },
                icon: Icon(
                  Icons.search,
                  size: 23,
                  color: dfontcolor,
                ))
          ],
        ),
        backgroundColor: dbackgroundColor,
        body: allListController.isLoading.value
            ? dLoading(size.height * 0.2, size.width * 0.4)
            : Container(
                color: dbackgroundColor,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: allListController.movies.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(Detail(
                            movie: allListController.movies[index],
                          ));
                        },
                        child: movieTile(allListController.movies[index].image,
                            allListController.movies[index].name),
                      );
                    }),
              ));
  }
}
