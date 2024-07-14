import 'package:flutter/material.dart';
import 'package:perpusflutter/models/book.dart';
import 'package:perpusflutter/widget/book_card.dart';

class ReadingPage extends StatefulWidget {
  final List<Book> books;
  final Function callbackRead;
  final Function callbackRemove;
  const ReadingPage({
    super.key,
    required this.books,
    required this.callbackRead,
    required this.callbackRemove,
  });

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Books"),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: widget.books.isEmpty
                ? [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: const Center(
                        child: Text(" Nothing in Reading List"),
                      ),
                    ),
                  ]
                : List.generate(
                    widget.books.length,
                    (index) => CardBook(
                          book: widget.books[index],
                          callbackRead: widget.callbackRead,
                          callbackRemove: widget.callbackRemove,
                          isRead: true,
                        ))),
      ),
    );
  }
}
