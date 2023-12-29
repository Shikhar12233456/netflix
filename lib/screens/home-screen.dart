import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/const/bottom-nav-bar.dart';
import 'package:netflix_clone/const/default.dart';
import 'package:netflix_clone/controllers/bottom-nav-bar-controller.dart';
import 'package:netflix_clone/screens/home-widget.dart';
import 'package:netflix_clone/screens/search-widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bottomNavBarController =
      Get.put(BottomNavBarController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dbackgroundColor,
      bottomNavigationBar:
          BNB.buildBottomNavigationMenu(context, bottomNavBarController),
      body: Obx(() => IndexedStack(
            index: bottomNavBarController.currIndex.value,
            children: [MainScreen(), Search()],
          )),
    );
  }
}
