import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:perpusflutter/models/book.dart';
import 'package:perpusflutter/ui/detail_page.dart';

class CardBook extends StatelessWidget {
  final Book book;
  final Function callbackRead;
  final Function callbackRemove;
  final bool isRead;
  const CardBook({
    required this.book,
    required this.callbackRead,
    required this.callbackRemove,
    this.isRead = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final x = book.gambar == ""
        ? const AssetImage("assets/placeholder.gif")
        : AssetImage(book.gambar);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetail(
              book: book,
              callbackRead: callbackRead,
              callbackRemove: callbackRemove,
              isRead: isRead,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        margin: const EdgeInsets.only(bottom: 10),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 22),
              alignment: Alignment.bottomRight,
              width: MediaQuery.of(context).size.width - 34,
              height: 95.0,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Card(
                color: Theme.of(context).colorScheme.inversePrimary,
                child: Container(
                  width: MediaQuery.of(context).size.width * 3 / 4 - 54,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.judul,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        book.pengarang,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black87,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Expanded(
                          child: Divider(
                        color: Colors.transparent,
                      )),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: RatingStars(
                          value: book.star,
                          starSize: 15,
                          valueLabelColor: const Color(0xff9b9b9b),
                          valueLabelTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          valueLabelRadius: 10,
                          maxValue: 5,
                          maxValueVisibility: false,
                          valueLabelVisibility: true,
                          animationDuration: const Duration(milliseconds: 1000),
                          valueLabelPadding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 8),
                          valueLabelMargin: const EdgeInsets.only(right: 8),
                          starOffColor: const Color(0xffe7e8ea),
                          starColor: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 34, bottom: 10),
              height: 140,
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: x,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
