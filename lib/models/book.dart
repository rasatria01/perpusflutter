class Book {
  int id;
  String judul;
  String pengarang;
  String gambar;
  String sinopsis;
  double star;

  Book(
      {required this.id,
      required this.judul,
      this.pengarang = "-",
      this.gambar = "",
      this.sinopsis = "-",
      this.star = 0});

  factory Book.fromJson(Map<String, dynamic> obj) {
    return Book(
        id: obj['id'],
        judul: obj['judul'],
        pengarang: obj['pengarang'],
        gambar: obj['gambar'],
        sinopsis: obj['sinopsis']);
  }
}
