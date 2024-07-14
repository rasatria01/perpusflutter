import 'package:flutter/material.dart';
import 'package:perpusflutter/models/book.dart';
import 'package:perpusflutter/models/user.dart';
import 'package:perpusflutter/ui/account_page.dart';
import 'package:perpusflutter/ui/book_page.dart';
import 'package:perpusflutter/ui/reading_page.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({
    super.key,
    required this.user,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final books = [
    Book(
      id: 1,
      judul: "Poster Literasi",
      pengarang: "Kementerian Pendidikan dan Kebudayaan Republik Indonesia",
      gambar: "assets/Poster Literasi_01.jpeg",
      star: 3.5,
    ),
    Book(
      id: 2,
      judul: "Sepenggal Kisah Anak Rantau",
      pengarang: "Ketut Susilo",
      sinopsis:
          "\"Sepenggal Kisah Anak Rantau\" adalah sebuah kisah yang mengharukan dan menginspirasi tentang perjalanan hidup seorang anak yang mencari jati dirinya dan menemukan arti sebenarnya dari hidup yang mengisahkan tentang perjalanan hidup seorang anak bernama Rantau yang tumbuh di pedesaan. Rantau adalah anak yang cerdas dan penuh semangat, namun ia harus menghadapi berbagai kesulitan dan rintangan dalam hidupnya.",
      gambar: "assets/Sepenggal Kisah Anak Rantau_02.jpeg",
    ),
    Book(
      id: 3,
      judul: "Si Merah di Simpang Republik",
      pengarang: "Ketut Susilo",
      sinopsis:
          "\"Si Merah di Simpang Republik\" adalah sebuah buku yang mengisahkan tentang perjalanan hidup seorang aktivis politik yang berjuang untuk memperjuangkan hak-hak rakyat dan menentang kesewenang-wenangan pemerintah. Dalam cerita ini, sang aktivis, yang dijuluki \"Si Merah\", harus menghadapi berbagai rintangan dan tantangan dalam perjuangannya.",
      gambar: "assets/si merah_03.jpeg",
    ),
    Book(
      id: 7,
      judul: "Percy Jackson's Greek Gods",
      pengarang: "Hans Christian Andersen",
      gambar: "assets/little mermaid_07.jpeg",
    ),
    Book(
      id: 7,
      judul: "Percy Jackson's Greek Gods",
      pengarang: "Hans Christian Andersen",
      gambar: "assets/little mermaid_07.jpeg",
    ),
  ];
  final List<Book> _readingList = [];

  addReadingList(Book book) {
    setState(() {
      _readingList.add(book);
    });
  }

  removeFromReadingList(Book book) {
    setState(() {
      _readingList.remove(book);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: [
            BookPage(
              books: books,
              callbackremove: removeFromReadingList,
              callbackAdd: addReadingList,
              readingBook: _readingList,
            ),
            ReadingPage(
              books: _readingList,
              callbackRemove: removeFromReadingList,
              callbackRead: addReadingList,
            ),
            AccountPage(user: widget.user),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.book),
              text: "Books",
            ),
            Tab(
              icon: Icon(Icons.library_books),
              text: "Reading List",
            ),
            Tab(
              icon: Icon(Icons.account_box),
              text: "Account",
            )
          ],
        ),
      ),
    );
  }
}
