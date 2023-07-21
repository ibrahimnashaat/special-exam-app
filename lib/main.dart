import 'package:permission_handler/permission_handler.dart';
import 'package:special_exam_app/shared/constatnts/constants.dart';
import 'package:special_exam_app/shared/local/cach_helper/cach_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'bloc/main_cubit/mian_cubit.dart';
import 'layouts/login/login.dart';
import 'layouts/main_home/home.dart';
import 'layouts/on_boarding/on_boarding.dart';
import 'package:sizer/sizer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await cachHelper.init();

  Widget widget ;

   var onBoarding = cachHelper.getData(key: 'onBoarding');
  bool? googleValue = cachHelper.getData(key: 'googleSignInOrNot');
   //var token = cachHelper.getData(key: 'token');
  // print(onBoarding);


   uId = cachHelper.getData(key: 'uId');

  if (uId != null || googleValue == true ){
    widget = Home();
  }else{
    if(onBoarding != null){
    widget = Login();}
    else{
      widget = OnBoarding();
    }
  }
  // if (onBoarding != null){
  //
  //   if (token != null){
  //     widget = Home();
  //   }else{
  //     widget = Login();
  //   }
  //
  // }else{
  //   widget = OnBoarding();
  // }

  runApp( MyApp(
      startWidget: widget
  ));
}

class MyApp extends StatefulWidget {

  final Widget startWidget;

  MyApp({required this.startWidget});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final bool onBoarding;

  @override
  void initState(){
    requestPermission();
    super.initState();
  }
  void requestPermission()async{
    var status = await Permission.storage.status;
    if(!status.isGranted){
      await Permission.storage.request();
    }
    var status1 = await Permission.manageExternalStorage.status;
    if(!status1.isGranted){
      await Permission.manageExternalStorage.request();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SocialCubit()..getUserData(),
        ),

      ],
      child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(

              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(

                  selectedItemColor: color1,
                  unselectedItemColor: color3.withOpacity(0.5)

                ),
                appBarTheme: AppBarTheme(

                  iconTheme: IconThemeData(
                      color: color1,
                      size: 30
                  ),
                  color: HexColor('#304149'),
                  elevation: 0.0,

                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('#304149'),
                    statusBarIconBrightness: Brightness.light,

                  ),



                ),

                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: Colors.grey[120],

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#f8f043'),),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:HexColor('#f8f043'),),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor('#f8f043')),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),



              ),
              home: Directionality(
                textDirection: TextDirection.rtl,
                // child: Pdf(),
                child: widget.startWidget,
              ),
              //startWidget
            );
          }
      ),
    );
  }
}

