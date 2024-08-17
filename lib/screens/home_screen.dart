import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  File file = File("");
  late FilePickerResult result;
  late Uint8List _pdfBites;

  Future<void> _openFile() async {
    result = (await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']))!;
    _pdfBites = await File(result.files.single.path!).readAsBytes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // ListView.builder(
        //   itemCount: 1,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text("List tile"),
        //     );
        //   },
        // ),
        ElevatedButton(
            onPressed: () {
              _openFile();
            },
            child: const Text("upload single file"))
      ],
    );
  }
}
