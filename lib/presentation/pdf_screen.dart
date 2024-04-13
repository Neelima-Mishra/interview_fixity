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
              _openPDF(context, pdfUrls[index],"index${index+1}");
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
    print("pathOfPdf.path->${File(pathOfPdf.path).length==0}");
    if (connectivityResult == ConnectivityResult.mobile) {
      if(File(pathOfPdf.path).length!=0){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PDFViewer(pdfPath:pathOfPdf.path)),
        );
      }else{
        pdfPath = await downloadPDF(url,pdfName);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PDFViewer(pdfPath:pdfPath)),
        );
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      if(File(pathOfPdf.path).length!=0){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PDFViewer(pdfPath:pathOfPdf.path)),
        );
      }else{
        pdfPath = await downloadPDF(url,pdfName);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PDFViewer(pdfPath:pdfPath)),
        );
      }
    } else {
      print("pathOfPdf.path->${File(pathOfPdf.path).length==0}");
      if(File(pathOfPdf.path).length!=0){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PDFViewer(pdfPath:pathOfPdf.path)),
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar((const SnackBar(content: Text("please Check Internet"))));
      }
    }
  }
}
