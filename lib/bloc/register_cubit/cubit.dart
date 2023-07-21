import 'package:special_exam_app/bloc/register_cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/class_user_model.dart';
import '../../models/login_model/login_model.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);

  QuizLoginModel? loginModel;






   void createUser (
      {
        required String name,
        required String email,
        required String phone,
        required String uId,

      }
      ){

      UserModel model = UserModel(
      name : name,
      email:email,
      phone:phone,
      uId:uId,
      isEmailVerified: false,
      image : 'assets/images/logo.png',
      cover: 'assets/images/logo.png',
      bio: 'write your bio ...',

    );

    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {

      print('يعمل');
      emit(RegisterCreateUserSuccessStates(uId: uId));
    }).catchError((error){
      print ('لا يعمل');
      emit(RegisterCreateUserErrorStates(error.toString()));
    });

  }


  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
    required BuildContext context,


  }) async {
    emit(RegisterLoadingStates());

    showDialog(
      context: context,
      builder:(context){
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

   await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,).then((value){
          print(value.user!.email);
          print(value.user!.uid);

          print('تم ادخال البيانات');

         createUser(
            name : name,
            email:email,
            phone:phone,
            uId:value.user!.uid,

          );
         emit(RegisterSuccessStates());

    }).catchError((error){
          emit(RegisterErrorStates(error.toString()));
    });
  }



  IconData suffix = Icons.visibility_off;
  bool isNotVisible = true;

  void changePasswordVisability() {
    isNotVisible = !isNotVisible;

    suffix = isNotVisible ? Icons.visibility_off : Icons.visibility;
    emit(PasswordStates());
  }
}
