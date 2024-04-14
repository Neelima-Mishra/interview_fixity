// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:interview_fixity/presentation/pdf_viewer.dart';
import '../app/functions.dart';

class PdfScreen extends StatelessWidget {
  final List<String> pdfUrls;
  const PdfScreen({Key? key,required this.pdfUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: ListView.builder(
        itemCount: pdfUrls.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('PDF ${index + 1}'),
            onTap: () {
              print(pdfUrls[index].substring(10));
              _openPDF(context, pdfUrls[index],"index${index+1}${(pdfUrls[index].substring(10)).replaceAll("/", "")}");
            },
          );
        },
      ),
    );
  }

  void _openPDF(BuildContext context, String url, String pdfName) async {
    String pdfPath = "";
    var connectivityResult = await (Connectivity().checkConnectivity());
    final File pathOfPdf = await readFile(pdfName);
    print("pathOfPdf.path22222->${await File(pathOfPdf.path).existsSync()}");
    if (connectivityResult == ConnectivityResult.mobile) {
      if(File(pathOfPdf.path).existsSync()){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PDFViewer(pdfPath:pathOfPdf.path, url: url, pdfName: pdfName,)),
        );
      }else{
        pdfPath = await downloadPDF(url,pdfName,context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PDFViewer(pdfPath:pathOfPdf.path, url: url, pdfName: pdfName,)),
        );
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      if(File(pathOfPdf.path).existsSync()){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PDFViewer(pdfPath:pathOfPdf.path, url: url, pdfName: pdfName,)),
        );
      }else{
        pdfPath = await downloadPDF(url,pdfName,context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PDFViewer(pdfPath:pathOfPdf.path, url: url, pdfName: pdfName,)),
        );
      }
    } else {
    if(File(pathOfPdf.path).existsSync()){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PDFViewer(pdfPath:pathOfPdf.path, url: url, pdfName: pdfName,)),
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar((const SnackBar(content: Text("please Check Internet"))));
      }
    }
  }
}
