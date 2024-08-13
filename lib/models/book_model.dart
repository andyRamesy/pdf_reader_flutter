class BookModel {
  final String title;
  final String author;
  final int pages;
  final String thumbnail;
  final String fileSize;
  final String lastOpened;
  final bool isFavorite;

  BookModel(
      {required this.title,
      required this.author,
      required this.pages,
      required this.thumbnail,
      required this.fileSize,
      required this.lastOpened,
      required this.isFavorite});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'],
      author: json['author'],
      pages: json['pages'],
      thumbnail: json['thumbnail'],
      fileSize: json['fileSize'],
      lastOpened: json['lastOpened'],
      isFavorite: json['isFavorite'],
    );
  }
}
