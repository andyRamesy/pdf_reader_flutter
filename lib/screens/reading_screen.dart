import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadingScreen extends StatefulWidget {
  final Uint8List pdfBytes;
  const ReadingScreen({super.key, required this.pdfBytes});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Visibility(
          visible: widget.pdfBytes.isNotEmpty,
          child: SfPdfViewer.memory(widget.pdfBytes,
              controller: _pdfViewerController)),
    ));
  }
}
