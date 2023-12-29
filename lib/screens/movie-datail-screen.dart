import 'package:flutter/material.dart';
import 'package:netflix_clone/const/const-widget.dart';
import 'package:netflix_clone/const/default.dart';
import 'package:netflix_clone/models/movie.dart';

class Detail extends StatelessWidget {
  const Detail({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: dbackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: size.height * 0.6,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: movie.image == null
                      ? const DecorationImage(
                          opacity: 0.6,
                          image: AssetImage('assets/images/N.png'),
                          fit: BoxFit.fill)
                      : DecorationImage(
                          opacity: 0.6,
                          image: NetworkImage(movie.image['original']),
                          fit: BoxFit.fill)),
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: size.width * 0.2,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          image: DecorationImage(
                              image: AssetImage('assets/images/N.png'))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 7),
                      child: Container(
                        alignment: Alignment.topLeft,
                        height: 75,
                        width: size.width * 0.75,
                        // width: size.width * 0.8,
                        child: Text(
                          movie.name,
                          style: dheadingStyle(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                richTextWithHeading("Released On: ", movie.premiered, 18),
                richTextWithHeading(
                    "Run time: ", "${movie.runtime.toString()} min", 18),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                richTextWithHeading("Type: ", movie.type, 18),
                richTextWithHeading("Language: ", movie.lang, 18),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                richTextWithHeading("Status: ", movie.status, 18),
                richTextWithHeading("imdb: ", movie.imdb, 18),
              ],
            ),
            richTextWithList("Genres", movie.genres, 18),
            richTextWithHeading("Summary: \n", movie.summary, 22),
          ],
        ),
      ),
    );
  }
}
