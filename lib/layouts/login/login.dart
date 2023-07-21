import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';
import 'package:special_exam_app/shared/local/cach_helper/cach_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../bloc/login_cubit/cubit.dart';
import '../../bloc/login_cubit/states.dart';
import '../../bloc/main_cubit/mian_cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/constatnts/constants.dart';
import '../main_home/home.dart';
import '../register/register.dart';




class Login extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: HexColor('#304149'),
      body: BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (BuildContext context, Object? state) {

            if (state is LoginErrorStates ){

              showToast(
                  msg: 'الايميل أو الباسورد غير صحيح الرجاء المحاولة مرة اخرى!',
                  state: ToastStates.ERORR
              );

              // cachHelper.saveData(key: 'token', value: false);

            }
            else if (state is LoginUsingGoogleErrorStates){
              showToast(
                  msg: 'هناك خطأ الرجاء المحاولة مرة أخرى',
                  state: ToastStates.ERORR
              );
            }
            else if (state is LoginSuccessStates  ) {

              cachHelper.saveData(key: 'uId', value: state?.uId).then(
                      (value) {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) => Home()), (route) => false);
                        SocialCubit.get(context).getUserData();
                        cachHelper.saveData(key: 'googleSignInOrNot', value: false);
                      }).catchError((error){

                        print(error.toString());

              });
              
                          }
            else if (state is LoginUsingGoogleSuccessStates){

              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => Home()), (route) => false);
              cachHelper.saveData(key: 'googleSignInOrNot', value: true);

              showToast(
                  msg: 'مرحباً بك في علمني.',
                  state: ToastStates.SUCCESS
              );

            }


          },
          builder: (BuildContext context, state) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: HexColor('#f8f043'),
                          backgroundImage: AssetImage(
                            'assets/images/logo.png',
                          ),
                        ),

                        SizedBox(
                          height:40,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء ادخال الايميل';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Text('الايميل',
                            style: TextStyle(
                              color: Colors.white
                            ),
                            ),
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: LoginCubit.get(context).isNotVisible,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء ادخال كلمة السر';
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              label: Text('كلمة السر',
                                style: TextStyle(
                                  color: color3,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: color3,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(LoginCubit.get(context).suffix,
                                  color: color3,
                                ),

                                onPressed: () {
                                  LoginCubit.get(context)
                                      .changePasswordVisability();
                                },
                              )),
                        ),
                      SizedBox(
                       height: 6.h,
                      ),

                        ConditionalBuilder(
                          condition: state != LoginLoadingStates,
                          builder: (BuildContext context) => Container(
                            width: double.infinity,
                            height: 50.0,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.white24)),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    context: context

                                  );
                                  name =SocialCubit.get(context).userModel?.name;

                                }
                              },
                              color: HexColor('#f8f043'),
                              textColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child:
                                  Text("تسجيل دخول", style: TextStyle(fontSize: 28,
                                  color: color2
                                  )),
                            ),
                          ),
                          fallback: (BuildContext context) =>
                              CircularProgressIndicator(),
                        ),

                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('ليس لديك حساب ؟',
                              style: TextStyle(
                                  color: color3.withOpacity(0.5)
                              ),),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Register()), (route) => false);

                                }, child: Text('سجل الان',
                              style: TextStyle(
                                  color: color3
                              ),
                            ))
                          ],
                        ),



                        SizedBox(
                          width: double.infinity,
                          height: 5.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text('______   أو سجل الدخول من خلال الجيميل   _______',
                                    style: TextStyle(
                                        color: color3.withOpacity(0.5)
                                    ),),
                                ),
                              ),

                            ],
                          ),
                        ),

                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            SizedBox(
                              width: 12.h,
                              height: 12.h,

                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color:color3.withOpacity(0.2),

                                ),


                              ),
                            ),
                            SizedBox(
                              width: 10.h,
                              height: 10.h,

                              child: GestureDetector(
                                onTap: () {

                                  showToast(
                                      msg: 'أنتظر قليلاً',
                                      state: ToastStates.WARNING
                                  );

                                   LoginCubit.get(context).signInWithGoogle();
                                },

                                child: Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color:Colors.white.withOpacity(0.5),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/gmail_logo.png',
                                      ),
                                    ),
                                  ),



                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );


  }





}
