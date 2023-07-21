
import 'package:special_exam_app/shared/local/cach_helper/cach_helper.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




import '../../bloc/main_cubit/mian_cubit.dart';
import '../../bloc/register_cubit/cubit.dart';
import '../../bloc/register_cubit/states.dart';

import '../../shared/constatnts/constants.dart';
import '../login/login.dart';
import '../main_home/home.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();
  var genderController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  final database = FirebaseDatabase.instance.ref();

  // late String birthDateInString;
  //
  // late DateTime birthDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      body: BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (BuildContext context, Object? state) {
            if (state is RegisterCreateUserSuccessStates) {
              cachHelper.saveData(key: 'uId', value: state.uId);

              Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => Home()), (route) => false);

              SocialCubit.get(context).getUserData();
              name =SocialCubit.get(context).userModel!.name;
              cachHelper.saveData(key: 'googleSignInOrNot', value: false);




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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: color1,
                          backgroundImage: AssetImage(
                            'assets/images/logo.png',
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء ادخال الاسم';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Text('الاسم كامل',
                            style: TextStyle(
                              color: color3
                            ),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: color3,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
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
                                  color: color3
                              ),),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: color3,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'الرجاء ادخال رقم الهاتف';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Text('رقم الهاتف',
                              style: TextStyle(
                                  color: color3
                              ),),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: color3,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: RegisterCubit.get(context).isNotVisible,
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
                                    color: color3
                                ),),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: color3,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(RegisterCubit.get(context).suffix,
                                  color: color3,
                                ),
                                onPressed: () {
                                  RegisterCubit.get(context)
                                      .changePasswordVisability();
                                },
                              )),
                        ),
                        SizedBox(
                          height: 16,
                        ),





                        SizedBox(
                          height: 26,
                        ),
                        ConditionalBuilder(
                          condition: state != RegisterLoadingStates,
                          builder: (BuildContext context) => Container(
                            width: double.infinity,
                            height: 50.0,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.white24)),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text,
                                    context: context
                                  );
                                }
                              },
                              color: color1,
                              textColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: Text("إنشاء حساب",
                                  style: TextStyle(fontSize: 22,
                                  color: color2
                                  )),
                            ),
                          ),
                          fallback: (BuildContext context) =>
                              CircularProgressIndicator(),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'هل لديك حساب ؟',
                              style: TextStyle(color: color3.withOpacity(0.5)),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                      (route) => false);
                                },
                                child: Text('تسجيل الدخول',
                                  style: TextStyle(
                                      color: color3
                                  ),))
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
