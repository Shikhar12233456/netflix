import 'package:flutter/material.dart';
import 'package:netflix_clone/const/default.dart';

Widget richTextWithHeading(String heading, String? text, double hs) {
  return padding(
    RichText(
      text: TextSpan(
        // text: "Release date: ",
        children: <TextSpan>[
          TextSpan(
            text: heading,
            style: TextStyle(
                color: dfontcolor.withOpacity(0.9),
                fontSize: hs,
                fontWeight: dfontweight),
          ),
          TextSpan(
              text: text == "" ? "Unknown" : text,
              style: TextStyle(
                  color: dfontcolor.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                  wordSpacing: 1))
        ],
      ),
    ),
  );
}

Widget richTextWithList(String heading, List<dynamic> list, double hs) {
  return padding(
    RichText(
      text: TextSpan(
        text: "Genres: ",
        children: <TextSpan>[
          for (int i = 0; i < list.length; i++)
            TextSpan(
              text: i == list.length - 1 ? "${list[i]}." : "${list[i]}, ",
              style: TextStyle(
                  color: dfontcolor.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                  wordSpacing: 1),
            ),
        ],
        style: TextStyle(
            color: dfontcolor.withOpacity(0.9),
            fontSize: hs,
            fontWeight: dfontweight),
      ),
    ),
  );
}
