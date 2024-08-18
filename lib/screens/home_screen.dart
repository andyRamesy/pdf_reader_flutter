import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdf_viewer_flutter/screens/reading_screen.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:syncfusion_pdfviewer_platform_interface/pdfviewer_platform_interface.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PlatformFile> files = [];
  late FilePickerResult result;
  Future<List<PlatformFile>>? futureFiles;

  @override
  void initState() {
    super.initState();
  }

  Future<List<PlatformFile>> pickFile() async {
    result = (await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowedExtensions: ['pdf'],
      type: FileType.custom
    ))!;

    if (result.count > 0) {
      setState(() {
        files.addAll(result.files);
      });
      return files;
    }
    return [];
  }

  Future<void> openFile(int index) async {
    Uint8List pdfBytes = await File(files[index].path!).readAsBytes();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return ReadingScreen(
          pdfBytes: pdfBytes,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    futureFiles = pickFile();
                  });
                },
                child: const Text("Upload single file"),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: FutureBuilder(
                future: futureFiles,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: files.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: const Icon(Icons.picture_as_pdf_sharp,
                                color: Colors.red),
                          ),
                          title: Text(files[index].name),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_red_eye,
                                    color: Colors.blue),
                                onPressed: () {
                                  openFile(index);
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.save, color: Colors.green),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
