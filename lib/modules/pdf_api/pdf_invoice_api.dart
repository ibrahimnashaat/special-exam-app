import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:special_exam_app/models/pdf_model/invoice.dart';
import 'package:special_exam_app/modules/pdf_api/pdf_api.dart';
import 'package:pdf/pdf.dart';
import 'package:special_exam_app/shared/constatnts/constants.dart';
import 'package:special_exam_app/shared/local/cach_helper/cach_helper.dart';




class PdfInvoiceApi {
  static Future<File> generate(Invoice invoice , String courseName, int degree) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [

        SizedBox(height: 5 * PdfPageFormat.cm),
        Divider(),
        buildTitle(invoice , courseName,degree),
        SizedBox(height: 0.1 * PdfPageFormat.cm),




      ],

          ));

    return PdfApi.saveDocument(name: 'alamnay.pdf', pdf: pdf);
  }







  static Widget buildTitle(Invoice invoice, String courseName, degree) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


                     Center(child:           Text(
  'CERTIFICATE',
  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
),),
                     SizedBox(height: 0.1 * PdfPageFormat.cm),
                     Center(child:           Text(
            'OF ACHIEVEMENT $courseName',
            style: TextStyle(fontSize: 24),
          ),),

          SizedBox(height: 1 * PdfPageFormat.cm),
                     Center(child:           Text(
            'THIS CERTIFICATE IS PRESENTED TO',
            style: TextStyle(fontSize: 14),
          ),),

          SizedBox(height: 1 * PdfPageFormat.cm),
                     Center(child:           Text(
            '${name??'NO NAME SELECTED'}',
            style:  TextStyle(fontSize: 40),
          ),),
          Center(
            child: SizedBox(
                width:300,
                child: Divider()
            ),
          ),
          Center(child:           Text(
            '$degree / 100',
            style:  TextStyle(fontSize: 40),
          ),),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Center(child:           Text(
            'PERSON ABOVE HAS COMPLETED THE SPECIAL PROGRAM IN EXCELLENCE',
            style:  TextStyle(fontSize: 12,),
          ),),

          SizedBox(height: 2 * PdfPageFormat.cm),
           Row(
             children: [

               Column(
                 children: [
                   Text(
                     '${DateTime.now().month} - ${DateTime.now().day} - ${DateTime.now().year}',
                     style:  TextStyle(fontSize: 12,),
                   ),
                   SizedBox(height: 0.1 * PdfPageFormat.cm),
                   SizedBox(
                       width:100,
                       child: Divider()
                   ),
                   SizedBox(height: 0.1 * PdfPageFormat.cm),
                   Text(
                     'Date',
                     style:  TextStyle(fontSize: 12,),
                   ),
                 ]
               ),
               Spacer(),
               Column(
                 children: [
                   Text(
                     'Alamnay',
                     style:  TextStyle(fontSize: 12,),
                   ),
                   SizedBox(height: 0.1 * PdfPageFormat.cm),
                   SizedBox(
                       width:100,
                       child: Divider()
                   ),
                   SizedBox(height: 0.1 * PdfPageFormat.cm),
                   Text(
                     'Signature',
                     style:  TextStyle(fontSize: 12,),
                   ),
                 ]
               ),
             ]
           ),
          SizedBox(height: 0.3 * PdfPageFormat.cm),
          Divider(),



        ],
      );









}
