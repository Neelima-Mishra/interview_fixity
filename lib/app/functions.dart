import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';


final List<String> pdfUrls = [
  'https://www.clickdimensions.com/links/TestPDFfile.pdf',
  'https://morth.nic.in/sites/default/files/dd12-13_0.pdf',
  'https://icseindia.org/document/sample.pdf',
  'https://www.orimi.com/pdf-test.pdf',
  'https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf',
];

Future<String> downloadPDF(String url, String pdfName) async {
  final response = await http.get(Uri.parse(url));
  print(response.body);
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/$pdfName.pdf';
  final file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return filePath;
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> readFile(String fileName) async {
  final path = await _localPath;
  return File('$path/$fileName.pdf');
}
