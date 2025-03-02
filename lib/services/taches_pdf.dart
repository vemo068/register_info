import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:register_info/models/tache.dart';
import 'package:register_info/services/pdf_api.dart';

List<Tache> taches = [
  Tache(
    id: 1,
    action_id: 1,
    agent_id: 1,
    date: DateTime.now(),
  ),
  Tache(
    id: 2,
    action_id: 2,
    agent_id: 2,
    date: DateTime.now(),
  ),
  Tache(
    id: 3,
    action_id: 3,
    agent_id: 3,
    date: DateTime.now(),
  ),
];

class PdfInvoiceApi {
  static Future<File> generateTaches(List<Tache> taches) async {
    var myTheme = ThemeData.withFont(
      base: Font.ttf(await rootBundle.load("assets/OpenSans-Regular.ttf")),
      bold: Font.ttf(await rootBundle.load("assets/OpenSans-Bold.ttf")),
      italic: Font.ttf(await rootBundle.load("assets/OpenSans-Italic.ttf")),
      boldItalic:
          Font.ttf(await rootBundle.load("assets/OpenSans-BoldItalic.ttf")),
    );
    final pdf = Document(
      theme: myTheme,
    );

    pdf.addPage(MultiPage(
      build: (context) => [
        Header(
          level: 0,
          child: Text('Taches List', style: TextStyle(fontSize: 24)),
        ),
        SizedBox(height: 0.7 * PdfPageFormat.cm),
        Divider(),
        tachesList(taches),
        Divider(),
      ],
    ));

    return PdfApi.saveDocument(
        name: 'Taches_List_${(DateTime.now()).toString().substring(0, 10)}.pdf',
        pdf: pdf);
  }

  static Widget tachesList(List<Tache> taches) {
    final headers = ['Motif ID', 'Agent ID', 'Date'];
    final data = taches.map((tache) {
      return [
        "${tache.action_id}",
        "${tache.agent_id}",
        DateFormat('yyyy-MM-dd').format(tache.date),
      ];
    }).toList();
    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
      },
    );
  }
}
