import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:special_exam_app/modules/quiz7/screens/quizz_screen.dart';
import 'package:special_exam_app/shared/constatnts/constants.dart';


import '../ui/shared/color.dart';


class MainMenu7 extends StatefulWidget {
  const MainMenu7({Key? key}) : super(key: key);

  @override
  _MainMenu7State createState() => _MainMenu7State();
}

class _MainMenu7State extends State<MainMenu7> {
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
