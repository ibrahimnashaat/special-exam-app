
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:special_exam_app/pdf_generator.dart';
import 'package:special_exam_app/shared/local/cach_helper/cach_helper.dart';

import '../constatnts/constants.dart';
import 'package:url_launcher/url_launcher.dart';



void showToast({required String msg, required ToastStates state})=>Fluttertoast.showToast(
msg: msg,
toastLength: Toast.LENGTH_LONG,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 5,
backgroundColor: chooseToastColor(state),
textColor: Colors.white,
fontSize: 16.0);

enum ToastStates{ERORR, SUCCESS, WARNING}

Color chooseToastColor(ToastStates test){
  Color color;
  switch(test){

    case ToastStates.SUCCESS:
      color = Colors.green;
      break;

    case ToastStates.ERORR:
      color = Colors.red;
      break;

    case ToastStates.WARNING:
      color = Colors.orange;
      break;



  }

  return color;
}



Widget oneElementWidget (
    {
      required String image,
      required String title,

      required BuildContext context,
      required Widget related_page,
      required String link,
      required String degree,
      required String courseName,

    }
    ){
  int result = cachHelper.getData(key: degree)??0;
  return Container(
    height: 30.0.h,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: color1.withOpacity(0.5),
    ),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                height: 30.0.h,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    )
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,

              ),
              Column(
                children: [
                  Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      color: color1.withOpacity(0.9)

                    ),
                    child: Center(
                      child: Text(
                        '${cachHelper.getData(key: degree)??0} / 100',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: color2
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                 result >=75 ? Pdf(courseName:courseName,degree: cachHelper.getData(key: degree)??0, ) : Column()
                ],
              ),

            ],
          ),
        ),
        SizedBox(
          width: 2.h,
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 6,

              bottom: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: color3,
                    ),



                  ),
                ),

                TextButton(
                  onPressed: (){

                    launch(link);
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('يمكنك مشاهدة الفيديوهات،اضغط على اللينك',
                          style: TextStyle(
                            fontSize: 15,

                            color: color3.withOpacity(0.5),
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,

                        ),
                      ),
                      Icon(
                        Icons.link,
                        color: color3,
                        size: 20,
                      ),
                    ],
                  )
                ),

                Spacer(),

                Expanded(

                  child: MaterialButton(

                    color: color2.withOpacity(0.8),


                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder:(context)=>related_page));


                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit,
                          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                          size: 28,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Center(
                          child: Text('الامتحان',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),),
      ],
    ),

  );
}

