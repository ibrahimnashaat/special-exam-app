import 'package:special_exam_app/shared/local/cach_helper/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login/login.dart';

class Swiping {
  late final String image;
  late final String text1;
  late final String text2;

  Swiping({required this.image, required this.text1, required this.text2});
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Swiping> swipingScreens = [
    Swiping(
        image: 'assets/images/page1.png',
        text1: 'ابدأ وتعلم',
        text2:
            'سوف يساعدك تطبيقنا على البدأ في التعلم، وسوف يسهل عليك عملية التعلم كثير مع الكثير من الفيديوهات والرسوم التوضيحية والامتحانات.'),
    Swiping(
        image: 'assets/images/page2.png',
        text1: 'أستمر في التقدم',
        text2:
            'من خلال تطبيقنا سوف تتعلم معنى السعي والاستمرار في تحقيق الانجازات سوف تتعلم الكثير عن اساسيات الكتابه واساسيات القراءة.'),
    Swiping(
        image: 'assets/images/page3.png',
        text1: 'حقق النجاح',
        text2:
            'سوف يساعدك تطبيقنا على التقدم وتحقيق المزيد والمزيد من النجاح، سوف تفتخر بنفسك كثيرا بعدما تكون قادرا على ان لا تحتاج لاحد مره اخرى لمساعدتك على التعلم.'),
  ];

  var pageController = PageController();
  bool isLast = false ;

  void submit(){
    cachHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value != null){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()), (route) => false);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#304149'),
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 24.w,
            child: TextButton(onPressed: submit,
              child:  Text('تخطي',style: TextStyle(
                  color: HexColor('#f8f043'),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 2
              ),),),
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
        left: 20.0,
          right: 20.0,
          bottom: 20.0,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(


            children: [

              Expanded(
                child: PageView.builder(
                  onPageChanged: (index){

                    if (index == swipingScreens.length-1){

                      setState ((){
                        isLast =true ;
                      });


                    }else {

                      setState ((){
                        isLast =false ;
                      });
                    }

                  },
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  itemBuilder: (context, index) =>
                      onBoarding(swipingScreens[index]),
                  itemCount: swipingScreens.length,
                ),
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: swipingScreens.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.black26,
                      activeDotColor: HexColor('#f8f043'),
                      dotHeight: 1.6.h,
                      dotWidth: 3.w,
                      spacing: 5,
                      expansionFactor: 3,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 10.h,
                    child: FloatingActionButton(
                      onPressed: () {

                        if (isLast){

                          submit();


                        }else{
                          pageController.nextPage(
                              duration: Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }


                      },
                      backgroundColor: HexColor('#f8f043'),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 3.h,
                        color: HexColor('#304149'),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget onBoarding(Swiping wid) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(
            flex: 10,
            child: Image.asset(
              '${wid.image}',

            ),
          ),
          Text(
            '${wid.text1}',
            style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2),
          ),
          SizedBox(
            height: 4.h,
          ),
          SizedBox(
            width: 80.w,
            child: Text(
              '${wid.text2}',
              //      'I have developed meaningful relationships with individuals of all ages, including seven-year-old Hillary. Many of my mentees come from disadvantaged backgrounds',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ),

        ],
      );
}
