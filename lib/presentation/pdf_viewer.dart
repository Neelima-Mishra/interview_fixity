import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../app/functions.dart';

class PDFViewer extends StatelessWidget {
  final String pdfPath;
  final String url;
  final String pdfName;
  const PDFViewer({Key? key,required this.pdfPath, required this.url, required this.pdfName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
              downloadFile(url,pdfName,context);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.download,size: 24,),
            ),
          ),
        ],
        title: const Text('PDF Viewer'),
      ),
      body: Center(
        child: PDFView(
          filePath: pdfPath,
        ),
      ),
    );
  }
}
