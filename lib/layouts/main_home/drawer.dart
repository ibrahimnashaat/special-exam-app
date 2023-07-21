import 'package:special_exam_app/bloc/main_cubit/main_states.dart';
import 'package:special_exam_app/bloc/main_cubit/mian_cubit.dart';
import 'package:special_exam_app/modules/drawer_pages/user_profile.dart';
import 'package:special_exam_app/shared/local/cach_helper/cach_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';


import '../../bloc/login_cubit/cubit.dart';
import '../../modules/drawer_pages/contact_us.dart';
import '../../shared/constatnts/constants.dart';
import '../login/login.dart';

class Drawers extends StatefulWidget {
   Drawers({Key? key}) : super(key: key);

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStutes>(
     listener: (context, state){},
     builder: (context,state){



      final model = SocialCubit.get(context).userModel;

      var image = model?.image;
      var cover = model?.cover;
      return Drawer(
       backgroundColor: color2,




       child: Container(

        child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(

          children: [


           SizedBox(
            height: 8.h,
           ),

           Row(
            children: [
             Icon(
              Icons.person_outline,
              color:color3,
             ),
             TextButton(
              onPressed: (){
               Navigator.push(context,MaterialPageRoute(builder: (context){
                return UserProfile();
               }));
              },
              child:  Text(
               'الملف الشخصي',
               style: TextStyle(
                fontSize: 20,
                color: color3,

               ),
              ),

             ),
            ],
           ),

           Row(
            children: [
             Icon(
              Icons.support_agent,
              color:color3,
             ),
             TextButton(
              onPressed: (){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Contact()),
               );
              },
              child:  Text(
               'إتصل بنا',
               style: TextStyle(
                fontSize: 20,
                color: color3,

               ),
              ),

             ),
            ],
           ),

           const Spacer(),
           Row(

            children: [
             Icon(
              Icons.logout,
              color: color3,
             ),
             TextButton(
              onPressed: (){
               cachHelper.removeData('uId').then((value) async {

                 Navigator.pushAndRemoveUntil(
                     context,
                     MaterialPageRoute(builder: (context)=>Login()), (route) =>false
                 );

                 cachHelper.removeData('quiz1');
                 cachHelper.removeData('quiz2');
                 cachHelper.removeData('quiz3');
                 cachHelper.removeData('quiz4');
                 cachHelper.removeData('quiz5');
                 cachHelper.removeData('quiz6');
                 cachHelper.removeData('quiz7');

                 SocialCubit.get(context).signOut();
                 cachHelper.removeData('googleSignInOrNot');



               }
               );

               FirebaseAuth.instance.signOut();
              },
              child: Text(
               'تسجيل الخروج',
               style: TextStyle(
                fontSize: 20,
                color: color3,

               ),
              ),

             ),
            ],
           ),
          ],
         ),
        ),
       ),
      );
     },
    );
  }
}
