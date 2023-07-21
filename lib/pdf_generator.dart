import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:special_exam_app/bloc/main_cubit/main_states.dart';
import 'package:special_exam_app/bloc/main_cubit/mian_cubit.dart';

import 'package:special_exam_app/models/pdf_model/invoice.dart';

import 'package:special_exam_app/modules/pdf_api/pdf_api.dart';
import 'package:special_exam_app/modules/pdf_api/pdf_invoice_api.dart';
import 'package:special_exam_app/shared/constatnts/constants.dart';
import 'package:special_exam_app/shared/local/cach_helper/cach_helper.dart';

class Pdf extends StatelessWidget {
  String courseName ='';
  int degree = 0;
  bool isLoginUsingGoogle = cachHelper.getData(key: 'googleSignInOrNot') ?? false ;
  String nameOfTheUserFromGoogleAccount = cachHelper.getData(key: 'name')??'';

  Pdf({super.key, required courseName,required degree}){
    this.courseName = courseName;
    this.degree = degree;
  }

  @override
  Widget build(BuildContext context){
    return BlocConsumer<SocialCubit, SocialStutes>(
        listener: (BuildContext context, state) {},
    builder: (BuildContext context, Object? state) {
      // final uId = FirebaseAuth.instance.currentUser?.uid;
      //
      // FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      //   model = UserModel.fromJson(value.data()!);
      // });
      final model = SocialCubit
          .get(context)
          .userModel;

      return  SizedBox(
        height:5.h,
        width: double.infinity,

        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
             ),
          onPressed: () async {
            final date = DateTime.now();


            final invoice = Invoice(


              items: [
                InvoiceItem(
                  information:model?.name ?? 'loading..',

                ),


              ],
            );

            name = isLoginUsingGoogle ? nameOfTheUserFromGoogleAccount :model?.name ?? 'loading..';

            final pdfFile = await PdfInvoiceApi.generate(invoice,courseName,degree);

            PdfApi.openFile(pdfFile);
          },
          color: color1.withOpacity(0.9),
          textColor: Theme.of(context).scaffoldBackgroundColor,
          child: Text(
            "الشهادة",
            style: TextStyle(fontSize: 28, color: color2),
            textAlign: TextAlign.center,

          ),
        ),
      );
    }
    );
  }
}
