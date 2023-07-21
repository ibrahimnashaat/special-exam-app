import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:special_exam_app/shared/local/cach_helper/cach_helper.dart';

import '../../../layouts/main_home/home.dart';
import '../../../shared/constatnts/constants.dart';
import '../ui/shared/color.dart';
import 'main_menu.dart';


class ResultScreen extends StatefulWidget {
  int score;
  ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pripmaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.score > 50 ? Container(
                    width: double.infinity,
                    height: 40.h,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:AssetImage('assets/images/win.gif',
                          )
                      ),


                    )):Container(),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.score > 50 ? "مبرووووك !"  : '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color1,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "درجتك هي",
                  style: TextStyle(color: Colors.white, fontSize: 34.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "${widget.score}",
                  style: TextStyle(
                    color: color1,
                    fontSize: 85.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainMenu3(),
                                ));
                          },
                          shape: StadiumBorder(),
                          color: color2,
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            "إعادة",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 4.h,),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {

                            cachHelper.saveData(key: 'quiz3', value: widget.score);

                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()), (route) => false);



                          },
                          shape: StadiumBorder(),
                          color: color2,
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            "الذهاب للرئيسية",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
