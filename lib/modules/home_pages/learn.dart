

import 'package:flutter/material.dart';



import 'package:sizer/sizer.dart';
import 'package:special_exam_app/modules/quiz7/screens/main_menu.dart';
import 'package:special_exam_app/shared/local/cach_helper/cach_helper.dart';

import '../../shared/components/components.dart';
import '../../shared/constatnts/constants.dart';
import '../quiz1/screens/main_menu.dart';
import '../quiz2/screens/main_menu.dart';
import '../quiz3/screens/main_menu.dart';
import '../quiz4/screens/main_menu.dart';
import '../quiz5/screens/main_menu.dart';
import '../quiz6/screens/main_menu.dart';





class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {


  List<Map> levels = [
    {
      'image' : 'https://th.bing.com/th/id/R.4c5483f8c82c93d7387a773270dcb669?rik=GlkSK%2fQlpjTkZA&pid=ImgRaw&r=0',
      'title' : 'اللغة العربية المستوى 1',
      Widget : MainMenu1(),
      'link' : 'https://www.youtube.com/watch?v=5Uhx1gxGNrA&list=PLN_d6itAXnCI7eDFxGG9gOcBSQbbYwXO5',
      'degree' : 'quiz1',
      'courseName': 'ARABIC COURSE LEVEL 1'

    },//0
    {
      'image' : 'https://th.bing.com/th/id/OIP.DvmQebMZQ9H916OBdcN7ggHaHa?pid=ImgDet&rs=1',
      'title' : 'اللغة العربية المستوى 2',
      Widget : MainMenu2(),
      'link' : 'https://www.youtube.com/watch?v=xkXedgaE01w&list=PLiSv5Y43Zxg1xaDiiDVjiJoZFAwNg50yP',
      'degree' : 'quiz2',
      'courseName': 'ARABIC COURSE LEVEL 2'



    },//
    {
      'image' : 'https://th.bing.com/th/id/OIP.PJh4JhgStSxEJik0r9ZrEAAAAA?pid=ImgDet&w=450&h=289&rs=1',
      'title' : 'اللغة العربية المستوى 3',
      Widget : MainMenu3(),
      'link' : 'https://www.youtube.com/watch?v=FkJf4g80iXw&list=PLhfhkdQ8PQkw7FQcuNtVUasVlyqBPX40s',
      'degree' : 'quiz3',
      'courseName': 'ARABIC COURSE LEVEL 3'

    },//
    {
      'image' : 'https://th.bing.com/th/id/R.002f02a32b9bce9da8ea94df5c560c6b?rik=e%2byOOraJlSQtTg&pid=ImgRaw&r=0',
      'title' : 'اللغة الرياضيه المستوى 1',
      Widget : MainMenu4(),
      'link' : 'https://www.youtube.com/watch?v=XXfAsmCSodg&list=PLCfvOh0MqV5UL4fp4BvTe1pxtDX9OkpVN',
      'degree' : 'quiz4',
      'courseName': 'MATHEMATICS COURSE LEVEL 1'


    },//
    {
      'image' : 'https://th.bing.com/th/id/R.7de693cc966e1d6040059ed6b7117278?rik=bYvaQMR7XSedBA&pid=ImgRaw&r=0',
      'title' : 'اللغة الرياضيه المستوى 2',
      Widget : MainMenu5(),
      'link' : 'https://www.youtube.com/watch?v=Lb0WzjG8xp8&t=4s',
      'degree' : 'quiz5',
      'courseName': 'MATHEMATICS COURSE LEVEL 2'


    },//
    {
      'image' : 'https://www.bing.com/th?u=https%3a%2f%2fwww.bing.com%2fth%3fid%3dOXI.TL-answers-esl%26h%3d246%26w%3d470%26qlt%3d50%26o%3d6%26dpr%3d1.6%26c%3d4&ehk=UVz7lCvUVmE%2fu569Z5qGgafrtRuZApduHe%2bFx9PcjEY%3d&w=472&h=248&o=6&pid=XMktPlace',
      'title' : 'اللغة الانجليزيه المستوى 1',
      Widget : MainMenu6(),
      'link' : 'https://www.youtube.com/watch?v=sD13y4iNQ4g&list=PL3jaAblAPiYo1mfpGj4cACZqrmkh6SwVM',
      'degree' : 'quiz6',
      'courseName': 'ENGLISH COURSE LEVEL 1'


    },//

  ];

  int quiz1 = cachHelper.getData(key: 'quiz1')??1;
  int quiz2 = cachHelper.getData(key: 'quiz2')??1;
  int quiz3 = cachHelper.getData(key: 'quiz3')??1;
  int quiz4 = cachHelper.getData(key: 'quiz4')??1;
  int quiz5 = cachHelper.getData(key: 'quiz5')??1;
  int quiz6 = cachHelper.getData(key: 'quiz6')??1;



  @override
  Widget build(BuildContext context) {
    int result = ((quiz1+quiz2+quiz3+quiz4+quiz5+quiz6)/6) . floor();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(

          children: [



            Expanded(
              flex: 11,
              child: ListView.separated(
                  itemBuilder: (context,index)=>oneElementWidget(
                    image: levels[index]['image'],
                    title:levels[index]['title'] ,
                    link: levels[index]['link'],
                    degree:levels[index]['degree']??'',
                    context: context,
                    related_page: levels[index][Widget ],
                    courseName: levels[index]['courseName'],



                  ),
                  separatorBuilder:(context,index)=> Container(
                    height: 4.0.h,
                  ),
                  itemCount: levels.length
              ),
            ),

            result >= 75 ? MaterialButton(

              color: color1,


              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder:(context)=>MainMenu7()));


              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit,
                    color: color2,
                    size: 28,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Center(
                    child: Text('الامتحان النهائي',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color:color2
                      ),
                    ),
                  )
                ],
              ),
            ):Column(),

            
          ],
        ),
      ),
    );
  }
}

