import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';


final List<String> pdfUrls = [
  'https://www.aeee.in/wp-content/uploads/2020/08/Sample-pdf.pdf',
  'https://morth.nic.in/sites/default/files/dd12-13_0.pdf',
  'https://icseindia.org/document/sample.pdf',
  'https://www.orimi.com/pdf-test.pdf',
  'https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf',
];

final List<String> pdfUrlsSecond = [
  "https://www.buds.com.ua/images/Lorem_ipsum.pdf",
  "https://www.escaux.com/rsrc/EscauxCustomerDocs/DRD_T38Support_AdminGuide/T38_TEST_PAGES.pdf",
  "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
  'https://www.orimi.com/pdf-test.pdf',
  'https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf',
];

final List<String> pdfUrlsThree = [
  'https://www.clickdimensions.com/links/TestPDFfile.pdf',
  'https://morth.nic.in/sites/default/files/dd12-13_0.pdf',
  'https://icseindia.org/document/sample.pdf',
  'https://www.orimi.com/pdf-test.pdf',
  'https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf',
];
Future<String> downloadPDF(String url, String pdfName, BuildContext context) async {
  final response = await http.get(Uri.parse(url));
  print(response.body);
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/$pdfName.pdf';
  final file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return filePath;
}

downloadFile(String url, String pdfName, BuildContext context){
  FileDownloader.downloadFile(
      url: url,
      name: "$pdfName.pdf",//(optional)
      onProgress: (String? fileName, double progress) {
        print('FILE fileName HAS PROGRESS $progress');
        ScaffoldMessenger.of(context).showSnackBar((SnackBar(content: Text("fileName HAS PROGRESS $progress"))));
      },
      onDownloadCompleted: (String path) {
        ScaffoldMessenger.of(context).showSnackBar((SnackBar(content: Text('FILE DOWNLOADED TO PATH: $path'))));
        print('FILE DOWNLOADED TO PATH: $path');
      },
      onDownloadError: (String error) {
        ScaffoldMessenger.of(context).showSnackBar((SnackBar(content: Text('DOWNLOAD ERROR: $error'))));
        print('DOWNLOAD ERROR: $error');
      });
}
Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> readFile(String fileName) async {
  final path = await _localPath;
  return File('$path/$fileName.pdf');
}
