import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

double dfontSize = 16;
Color dbackgroundColor = Colors.black;
Color dmainColor = Colors.redAccent;
Color dfontcolor = Colors.white;
Color ddescriptioncolor = Colors.white.withOpacity(0.4);
FontWeight dfontweight = FontWeight.w700;

Widget movieTile(dynamic image, String name) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.4), width: 1),
          borderRadius: BorderRadius.circular(10),
          image: image == null
              ? const DecorationImage(
                  image: AssetImage('assets/images/N.png'), fit: BoxFit.fill)
              : DecorationImage(
                  image: NetworkImage(image['medium']), fit: BoxFit.fill)),
      child: image == null
          ? Text(
              name,
              style: TextStyle(
                  fontSize: 25, color: dfontcolor, fontWeight: dfontweight),
            )
          : null,
    ),
  );
}

TextStyle dheadingStyle() {
  return TextStyle(
      color: dfontcolor,
      fontSize: 24,
      fontWeight: dfontweight,
      wordSpacing: 1,
      overflow: TextOverflow.fade);
}

Widget dLoading(double height, double width) {
  return Center(
    child: SizedBox(
      height: height,
      width: width,
      child: Lottie.asset('assets/json/Netflix-loading.json'),
    ),
  );
}

Widget dScreenWithCentreText(String text) {
  return Center(
    child: Text(
      text,
      style: TextStyle(
          color: dfontcolor.withOpacity(0.6),
          fontWeight: dfontweight,
          fontSize: 20),
    ),
  );
}

Widget searchMovieTile(double height, double width, dynamic image, String name,
    List<dynamic> genres, String lang, String? premiered) {
  return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4, bottom: 4),
      child: Container(
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: dfontcolor.withOpacity(0.4), width: 0.5)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.9,
                width: height * 0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: dfontcolor.withOpacity(0.2)),
                    image: image == null
                        ? const DecorationImage(
                            image: AssetImage('assets/images/N.png'),
                            fit: BoxFit.fill)
                        : DecorationImage(
                            image: NetworkImage(image['medium']),
                            fit: BoxFit.fill)),
              ),
            ),
            SizedBox(
              width: width - height * 1.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontWeight: dfontweight,
                        fontSize: 18,
                        color: dfontcolor,
                        overflow: TextOverflow.ellipsis),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Language: ",
                      children: <TextSpan>[
                        TextSpan(
                          text: lang,
                          style: TextStyle(
                              color: dfontcolor,
                              backgroundColor: dfontcolor.withOpacity(0.2)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Release date: ",
                      children: <TextSpan>[
                        TextSpan(
                          text: premiered ?? "Unknown",
                          style: TextStyle(
                              color: dfontcolor,
                              backgroundColor: dfontcolor.withOpacity(0.2)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < min(3, genres.length); i++)
                        Text(
                          "${genres[i]} ",
                          style: TextStyle(
                              color: dfontcolor,
                              backgroundColor: dfontcolor.withOpacity(0.2)),
                        )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ));
}

Padding padding(Widget widget) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5, bottom: 5),
    child: widget,
  );
}
