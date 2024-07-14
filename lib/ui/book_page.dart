import 'package:flutter/material.dart';
import 'package:perpusflutter/models/book.dart';
import 'package:perpusflutter/widget/book_card.dart';

class BookPage extends StatefulWidget {
  final List<Book> books;
  final List<Book> readingBook;
  final Function callbackAdd;
  final Function callbackremove;
  const BookPage(
      {super.key,
      required this.books,
      required this.callbackAdd,
      required this.callbackremove,
      required this.readingBook});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(
        //       Icons.arrow_back_ios_new,
        //       size: 20,
        //     )),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Books"),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: List.generate(widget.books.length, (index) {
          var found = false;
          for (var element in widget.readingBook) {
            if (element == widget.books[index]) {
              found = true;
            }
          }
          return CardBook(
            book: widget.books[index],
            callbackRead: widget.callbackAdd,
            callbackRemove: widget.callbackremove,
            isRead: found,
          );
        })),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
