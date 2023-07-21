import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:special_exam_app/shared/local/cach_helper/cach_helper.dart';
import 'package:special_exam_app/pdf_generator.dart';

import '../../bloc/main_cubit/main_states.dart';
import '../../bloc/main_cubit/mian_cubit.dart';
import '../../shared/constatnts/constants.dart';






class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
int num = cachHelper.getData(key: 'quiz7')??0;

  @override
  Widget build(BuildContext context) {

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

    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: 20,
          end: 20
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Image.asset('assets/images/R.gif'),
            SizedBox(height :8.h),

            num >= 75 ?SizedBox(
                width: double.infinity,
                height: 14.h,
                child: Pdf(courseName: 'ALL FUNDAMENTAL COURSES',degree:(num/6).floor(),)) : Column(),


            Text('مرحباً بك في علمني !',
              style: TextStyle(
                  color: color1,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold

              ),
            ),
            SizedBox(
              height: 4.h,
            ),

            Text('- قواعد التطبيق',
              style: TextStyle(
                  color: color3,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold

              ),
            ),
            Text('1- يجب ان تتحلى بالصبر في التعلم للحصول على افضل النتائج.',
              style: TextStyle(
                color: color3,
                fontSize: 13.sp,


              ),
            ),
            Text('2- يجب ان تتعلم من الدروس المعروضه في الفيديوهات اولا.',
              style: TextStyle(
                color: color3,
                fontSize: 13.sp,


              ),
            ),
            Text('3- ثم بعد ذلك يمكنك القيام بأختبار مهاراتك ونسبة تعلمك من خلال الدخول على الامتحان وقياس مستوى استيعابك للدروس.',
              style: TextStyle(
                color: color3,
                fontSize: 13.sp,


              ),
            ),
            Text('4- بعد ان تكمل الدروس والمستويات الاولى بنجاح سوف يتم فتح لك المستوى التالي له تلقائيا.',
              style: TextStyle(
                color: color3,
                fontSize: 13.sp,


              ),
            ),

            Text('5- بعد ان تكمل جميع المستويات بنسبة نجاح 75% او اكثر سوف يتم فتح لك امتحان شامل على كل الامتحانات اللتي اديتها سابقاً.',
              style: TextStyle(
                color: color3,
                fontSize: 13.sp,


              ),
            ),
            Text('6- لكي تحصل على شهادة التقدير يجب ان تختار على الاقل نسبة 75% من الاجابات الصحيحه.',
              style: TextStyle(
                color: color3,
                fontSize: 13.sp,


              ),
            ),
            Text('6- لكي تحصل على اسمك في شهادة التقدير يجب ان يكون اسمك باللغة الانجليزية',
              style: TextStyle(
                color: color3,
                fontSize: 13.sp,


              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text('تحذير !',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30.sp,


              ),
            ),
            Text('لا تقوم بحذف التطبيق او الخروج والدخول على حساب جديد قبل ان تنهي جميع المسارات وتحصل على جميع الشهاداة واذا خالفت هذا التحذير سوف تحرم من حصولك على الشهادات ولابد ان تقوم بإعادة المساق من البداية للحصول على شهادات التقدير',
              style: TextStyle(
                color: color3,
                fontSize: 13.sp,


              ),
            ),

          ],
        ),
      ),
    );

        });
  }


}
