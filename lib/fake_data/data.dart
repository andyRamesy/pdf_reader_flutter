import 'package:pdf_viewer_flutter/models/book_model.dart';

final List<BookModel> pdfList = [
  BookModel(
    title: 'Mastering Dart Programming',
    author: 'Alice Brown',
    pages: 320,
    thumbnail: 'assets/thumbnails/thumbnail_md.png',
    fileSize: '8 MB',
    lastOpened: '2024-08-12',
    isFavorite: false,
  ),
  BookModel(
    title: 'Pro Flutter UI Design',
    author: 'Robert Wilson',
    pages: 270,
    thumbnail: 'assets/thumbnails/thumbnail_pf.png',
    fileSize: '6.5 MB',
    lastOpened: '2024-08-09',
    isFavorite: true,
  ),
  BookModel(
      title: 'Flutter Development Guide',
      author: 'John Doe',
      pages: 200,
      thumbnail: 'assets/thumbnails/thumbnail_sk.png',
      fileSize: '5 MB',
      lastOpened: '2024-08-10',
      isFavorite: true),
];
