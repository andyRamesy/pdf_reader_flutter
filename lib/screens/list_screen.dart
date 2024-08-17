import 'package:flutter/material.dart';
import 'package:pdf_viewer_flutter/fake_data/data.dart';
import 'package:pdf_viewer_flutter/widget/book_item.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: GridView(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2/3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: pdfList.map((value) => BookItem(title: value.title,)).toList(),
        ),
      ),
    );
  }
}
