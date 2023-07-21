import 'package:google_sign_in/google_sign_in.dart';
import 'package:special_exam_app/bloc/login_cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:special_exam_app/shared/local/cach_helper/cach_helper.dart';

import '../../models/login_model/login_model.dart';




class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialStates());

  static LoginCubit get(context) => BlocProvider.of(context);

  QuizLoginModel? loginModel;

  void userLogin(
  {
  required String email,
    required String password,
    required BuildContext context,
}
      ){
    emit(LoginLoadingStates());
    showDialog(
      context: context,
      builder:(context){
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,).then((value) {
          emit(LoginSuccessStates(uId : value.user!.uid));
          print('Success');
          print(value.user!.email);
          print(value.user!.uid);
    }).catchError((error){
      emit(LoginErrorStates(error.toString()));
    });


  }

  IconData suffix =Icons.visibility_off_outlined;
  bool isNotVisible = true;

  void changePasswordVisability(){

    isNotVisible = !isNotVisible ;

    suffix = isNotVisible ? Icons.visibility_off_outlined: Icons.visibility_outlined;
    emit(PasswordStates());

  }


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn  _googleSignIn = GoogleSignIn();
  String? name;
  String? email;
  String? photo;
   signInWithGoogle() {

     emit(LoginUsingGoogleLoadingStates());

    _googleSignIn.signIn().then((value1) {

       value1!.authentication.then((value2) {

         AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken:value2.idToken ,
            accessToken: value2.accessToken
        );

        _auth.signInWithCredential(authCredential).then((value3){
          User? _user = value3.user;

          name = _user!.displayName;
          email = _user.email;
          photo = _user.photoURL;

          cachHelper.saveData(key: 'name', value: name);
          cachHelper.saveData(key: 'email', value: email);
          cachHelper.saveData(key: 'photo', value: photo);

          emit(LoginUsingGoogleSuccessStates(uId: _user.uid));

          print(email);
          print(name);
          print(photo);

        });





      });

    }).catchError((error){
      emit(LoginUsingGoogleErrorStates(error));
    });


  }



}