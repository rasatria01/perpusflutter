import 'package:flutter/material.dart';
import 'package:perpusflutter/models/book.dart';
import 'package:perpusflutter/ui/detail_page.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({super.key});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
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
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Log Out"),
              trailing: const Icon(Icons.logout),
              onTap: () {},
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardBook(
              book: Book(
                id: 1,
                judul: "Poster Literasi",
                pengarang:
                    "Kementerian Pendidikan dan Kebudayaan Republik Indonesia",
                gambar: "assets/Poster Literasi_01.jpeg",
              ),
            ),
            CardBook(
              book: Book(
                id: 2,
                judul: "Sepenggal Kisah Anak Rantau",
                pengarang: "Ketut Susilo",
                sinopsis:
                    "\"Sepenggal Kisah Anak Rantau\" adalah sebuah kisah yang mengharukan dan menginspirasi tentang perjalanan hidup seorang anak yang mencari jati dirinya dan menemukan arti sebenarnya dari hidup yang mengisahkan tentang perjalanan hidup seorang anak bernama Rantau yang tumbuh di pedesaan. Rantau adalah anak yang cerdas dan penuh semangat, namun ia harus menghadapi berbagai kesulitan dan rintangan dalam hidupnya.",
                gambar: "assets/Sepenggal Kisah Anak Rantau_02.jpeg",
              ),
            ),
            CardBook(
              book: Book(
                id: 3,
                judul: "Si Merah di Simpang Republik",
                pengarang: "Ketut Susilo",
                sinopsis:
                    "\"Si Merah di Simpang Republik\" adalah sebuah buku yang mengisahkan tentang perjalanan hidup seorang aktivis politik yang berjuang untuk memperjuangkan hak-hak rakyat dan menentang kesewenang-wenangan pemerintah. Dalam cerita ini, sang aktivis, yang dijuluki \"Si Merah\", harus menghadapi berbagai rintangan dan tantangan dalam perjuangannya.",
                gambar: "assets/si merah_03.jpeg",
              ),
            ),
            CardBook(
              book: Book(
                id: 7,
                judul: "Percy Jackson's Greek Gods",
                pengarang: "Hans Christian Andersen",
                gambar: "assets/little mermaid_07.jpeg",
              ),
            ),
            CardBook(
              book: Book(
                id: 7,
                judul: "Percy Jackson's Greek Gods",
                pengarang: "Hans Christian Andersen",
                gambar: "assets/little mermaid_07.jpeg",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CardBook extends StatelessWidget {
  final Book book;
  const CardBook({required this.book, super.key});

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
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black87,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 34, bottom: 10),
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
