import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:special_exam_app/modules/quiz3/screens/quizz_screen.dart';
import 'package:special_exam_app/shared/constatnts/constants.dart';


import '../ui/shared/color.dart';


class MainMenu3 extends StatefulWidget {
  const MainMenu3({Key? key}) : super(key: key);

  @override
  _MainMenu3State createState() => _MainMenu3State();
}

class _MainMenu3State extends State<MainMenu3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pripmaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 48.0,
          horizontal: 12.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "مستعد للأختبار ؟",
                style: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            Expanded(
              child: Center(
                child: RawMaterialButton(
                  onPressed: () {
                    //Navigating the the Quizz Screen

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizzScreen(),
                        ));
                  },
                  shape: const StadiumBorder(),
                  fillColor: color2,
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      "إبدأ الاختبار",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                "انشأ بالبحب ❤ بواسطة علمني",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
