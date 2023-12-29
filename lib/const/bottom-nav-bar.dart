import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/const/default.dart';
import 'package:netflix_clone/controllers/bottom-nav-bar-controller.dart';

class BNB {
  static unselectedLabelStyle() {
    return TextStyle(
        color: dfontcolor, fontWeight: FontWeight.w500, fontSize: 12);
  }

  static selectedLabelStyle() {
    return TextStyle(
        color: dmainColor, fontWeight: FontWeight.w500, fontSize: 12);
  }

  static Widget buildBottomNavigationMenu(
      BuildContext context, BottomNavBarController landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(1.0)),
        child: SizedBox(
            height: 67,
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                showSelectedLabels: true,
                onTap: landingPageController.changeValue,
                currentIndex: landingPageController.currIndex.value,
                backgroundColor: dbackgroundColor,
                unselectedItemColor: dfontcolor,
                selectedItemColor: dmainColor,
                unselectedLabelStyle: BNB.unselectedLabelStyle(),
                selectedLabelStyle: BNB.selectedLabelStyle(),
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        CupertinoIcons.home,
                        size: 25.0,
                      ),
                    ),
                    label: "Home",
                    backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: const Icon(
                        CupertinoIcons.search,
                        size: 25.0,
                      ),
                    ),
                    label: "Search",
                    backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
                  ),
                ]))));
  }
}
