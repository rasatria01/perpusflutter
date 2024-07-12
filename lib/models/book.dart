class Book {
  int id;
  String judul;
  String pengarang;
  String gambar;

  Book(
      {required this.id,
      this.judul = "",
      this.pengarang = "",
      this.gambar = ""});

  factory Book.fromJson(Map<String, dynamic> obj) {
    return Book(
      id: obj['id'],
      judul: obj['judul'],
      pengarang: obj['pengarang'],
      gambar: obj['gambar'],
    );
  }
}
