import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:lageado_ac/model/pdf/pdf_api.dart' as pdf;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class _PDFStructure{

}

class PDFModel{

  PDFModel(){
    _document = PdfDocument();
    _bytes = [];
    _structure = _PDFStructure();
  }

  late _PDFStructure _structure;
  late PdfDocument _document;
  late List<int> _bytes;

    Future<void> createPDF() async{
    final page = _document.pages.add();
    final Size pageSize = page.getClientSize();
    double wt = (page.size.width/2) - 40;
    //double wts = (page.size.width/2) - 150;
    page.graphics.drawImage(PdfBitmap(await _readImageData('lp_hr_small.jpg')),
        Rect.fromCenter(center: Offset(wt, 100), width: 180, height: 130));
    page.graphics.drawRectangle(
        bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
        pen: PdfPen(PdfColor(142, 170, 219, 255)));


    page.graphics.drawString("ORDEM DE SERVIÇO", PdfStandardFont(PdfFontFamily.helvetica, 20),
        brush: PdfBrushes.darkGray,
        bounds: Rect.fromCenter(center: Offset(page.size.width/2 - 45, 195), width: 280, height: 175),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle,alignment: PdfTextAlignment.center));

    page.graphics.drawString("ORÇAMENTO", PdfStandardFont(PdfFontFamily.helvetica, 16),
        brush: PdfBrushes.darkGray,
        bounds: Rect.fromCenter(center: Offset(page.size.width/2 - 45, 225), width: 280, height: 175),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle,
            alignment: PdfTextAlignment.center));

    page.graphics.drawString("IHWU84H3", PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfBrushes.darkGray,
        bounds: Rect.fromCenter(center: Offset(page.size.width/2 - 45, 275), width: 180, height: 175),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle,
            alignment: PdfTextAlignment.center));

    page.graphics.drawString("PALIO 1.6 2019", PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfBrushes.darkGray,
        bounds: Rect.fromCenter(center: Offset(page.size.width/2 - 45, 290), width: 300, height: 175),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle,
            alignment: PdfTextAlignment.center));

    page.graphics.drawString("SERVIÇO:\nTEXT LONGO --------------------------------------------------------\n\nTEXT LONGO -------------------------------\n\n\n\n\n\n\n\n\n\n\nTEXT LONGO -------------------------------",
        PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfBrushes.darkGray,
        bounds: Rect.fromCenter(center: Offset(page.size.width/3 + 50, 450), width: 400, height: 400),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle,
            alignment: PdfTextAlignment.left));

    _bytes = getDocument();
    reset();
    pdf.saveAndLaunchFile(_bytes, "fileName.pdf");
  }

  List<int> getBytes(){ return _bytes;}
  List<int> getDocument(){ return _document.save();}
  void reset(){_document.dispose();}
  Future<Uint8List> _readImageData(String name) async{
    print("Trying to load assets/$name");
    final data = await rootBundle.load('lib/assets/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}