import 'package:flutter/material.dart';
import 'package:interview_fixity/presentation/pdf_screen.dart';

class TabBarScreen extends StatelessWidget {
  final List<String> pdfUrls;
  const TabBarScreen({Key? key, required this.pdfUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PdfScreen(pdfUrls:pdfUrls)),
          );
        },
        child: const Text('Open PDF Screen'),
      ),
    );
  }
}
