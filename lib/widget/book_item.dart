import 'package:flutter/material.dart';
import 'package:pdf_viewer_flutter/screens/reading_screen.dart';

class BookItem extends StatelessWidget {
  final String title;
  const BookItem({super.key, required this.title});

  void gotoReading(BuildContext context) {
    
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => gotoReading(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
          // decoration: BoxDecoration(color: Colors.red),
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/thumbnails/thumbnail_sk.png',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
              ),
            ],
          )),
    );
  }
}
