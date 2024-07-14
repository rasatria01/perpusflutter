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
      sinopsis:
          " Pentingnya literasi sebagai investasi yang tak tergantikan untuk masa depan. Literasi sebagai kemampuan untuk mengakses, memahami, dan menggunakan informasi secara cerdas melalui berbagai aktivitas seperti membaca, melihat, menyimak, menulis, dan berbicara.",
      star: 3.7,
    ),
    Book(
      id: 2,
      judul: "Sepenggal Kisah Anak Rantau",
      pengarang: "Ketut Susilo",
      sinopsis:
          "\"Sepenggal Kisah Anak Rantau\" adalah sebuah kisah yang mengharukan dan menginspirasi tentang perjalanan hidup seorang anak yang mencari jati dirinya dan menemukan arti sebenarnya dari hidup yang mengisahkan tentang perjalanan hidup seorang anak bernama Rantau yang tumbuh di pedesaan. Rantau adalah anak yang cerdas dan penuh semangat, namun ia harus menghadapi berbagai kesulitan dan rintangan dalam hidupnya.",
      gambar: "assets/Sepenggal Kisah Anak Rantau_02.jpeg",
      star: 4,
    ),
    Book(
      id: 3,
      judul: "Si Merah di Simpang Republik",
      pengarang: "Ketut Susilo",
      sinopsis:
          "\"Si Merah di Simpang Republik\" adalah sebuah buku yang mengisahkan tentang perjalanan hidup seorang aktivis politik yang berjuang untuk memperjuangkan hak-hak rakyat dan menentang kesewenang-wenangan pemerintah. Dalam cerita ini, sang aktivis, yang dijuluki \"Si Merah\", harus menghadapi berbagai rintangan dan tantangan dalam perjuangannya.",
      gambar: "assets/si merah_03.jpeg",
      star: 5,
    ),
    Book(
      id: 4,
      judul: "Filimon Heights Series #1: Good Night Enemy",
      pengarang: "-",
      sinopsis:
          "Dalam novel ini, Anda akan dibawa ke dalam dunia yang penuh dengan ketegangan, kekerasan, dan psikologi yang sangat kompleks. \"Filimon Heights Series #1: Good Night Enemy\" adalah sebuah novel thriller psikologis yang mengisahkan tentang seorang wanita bernama Cutie yang tinggal di Filimon Heights, sebuah kompleks apartemen yang mewah dan eksklusif. Cutie memiliki masa lalu yang kelam dan trauma yang dalam, tetapi ia mencoba untuk memulai hidup baru di Filimon Heights.",
      star: 4.6,
    ),
    Book(
        id: 5,
        judul: "Leo And Aries",
        pengarang: "-",
        sinopsis:
            "Sebuah novel romantis yang mengisahkan tentang Mia, seorang wanita cantik dan cerdas yang memiliki dua pria yang sangat mencintainya, Leo dan Aries. Dalam novel ini, Anda akan dibawa ke dalam dunia yang penuh dengan cinta, persaingan, dan kejutan yang tidak terduga. Anda akan bertanya-tanya apakah Mia akan memilih Leo atau Aries, dan apa yang akan terjadi pada mereka di akhir cerita.",
        star: 3.8),
    Book(
      id: 6,
      judul: "Percy Jackson's Greek Gods",
      pengarang: "Rick Riordan",
      gambar: "assets/Percy Jackson's Greek Gods_06.jpeg",
      sinopsis:
          "\"Percy Jackson's Greek Gods\" adalah sebuah buku yang membahas tentang dewa dan dewi Yunani dari perspektif Percy Jackson, seorang anak laki-laki yang memiliki darah dewa. Dengan gaya cerita yang lucu dan menghibur, Percy Jackson's Greek Gods akan membawa kita ke dalam dunia mitologi Yunani yang penuh dengan keajaiban dan kekuatan supernatural. Buku ini sangat cocok untuk pembaca yang ingin mempelajari tentang mitologi Yunani dengan cara yang menyenangkan dan menghibur.",
      star: 4,
    ),
    Book(
      id: 7,
      judul: "The Little Mermaid ",
      pengarang: "Hans Christian Andersen",
      gambar: "assets/little mermaid_07.jpeg",
      sinopsis:
          "The Little Mermaid adalah sebuah cerita klasik tentang seorang putri duyung yang jatuh cinta dengan seorang pangeran manusia. Putri duyung ini rela meninggalkan kehidupan di laut dan mengorbankan suaranya untuk menjadi manusia dan bersama pangeran yang dicintainya. Namun, cinta mereka tidak berjalan mulus dan putri duyung harus menghadapi konsekuensi dari pilihannya.",
      star: 4.5,
    ),
    Book(
      id: 8,
      judul: "A Connecticut Yankee in King Arthur's Court",
      pengarang: "Mark Twain",
      gambar: "assets/king_08.jpeg",
      star: 4.3,
    ),
    Book(
      id: 9,
      judul: "Good Night Already!",
      pengarang: "-",
      sinopsis:
          "\"Good Night Already!\" adalah sebuah buku yang menceritakan tentang dua karakter, Beruang dan Bebek. Beruang ingin tidur, tetapi Bebek tidak ingin berhenti bermain dan mengganggu Beruang. Cerita ini penuh dengan humor dan ilustrasi yang lucu, membuat anak-anak tertawa dan belajar tentang pentingnya berbagi waktu dan menghargai teman.",
      gambar: "assets/good night already_09.jpeg",
      star: 3,
    ),
    Book(
      id: 10,
      judul: "Selenophile",
      pengarang: "Narda Aida",
      sinopsis:
          "Dalam \"Selenophile\", seorang Selenophile muda bernama Aria menemukan bahwa ia memiliki kemampuan untuk berkomunikasi dengan bulan. Ketika ia belajar menguasai kekuatannya, ia menemukan dunia sihir bulan yang tersembunyi dan rahasia kuno. Dengan bantuan teman-teman barunya, Aria harus menavigasi misteri bulan dan menghadapi kegelapan yang mengancam untuk menghancurkan keseimbangan alam semesta.",
      gambar: "assets/Selenophile_10.jpeg",
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
