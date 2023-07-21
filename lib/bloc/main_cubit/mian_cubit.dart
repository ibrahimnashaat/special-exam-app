import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:special_exam_app/models/class_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


import 'main_states.dart';

import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;




class SocialCubit extends Cubit<SocialStutes> {
  SocialCubit() : super(SocialInitiallStates());
  static SocialCubit get(context) => BlocProvider.of(context);
  int CurrentIndex = 0;




  UserModel? userModel;


  void getUserData()
 {
    emit(SocialGetUserLoadingStates());
    final uId = FirebaseAuth.instance.currentUser?.uid;
     FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel=UserModel.fromJson(value.data()!);
      print(userModel!.uId);

      emit(SocialGetUserSuccessStates());
    }).catchError((e){
      emit(SocialGetUserErrorStates());
    });


  }



  File? ProfileImage;
  var picker =ImagePicker();
  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      ProfileImage = File(pickedFile.path);
      emit( SocialProfileImagePeckerSuccessStates ());
    } else {
      print('No Image Selected!');
      emit(SocialProfileImagePeckerErrorStates());
    }
  }




  File? CoverImage;
  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      CoverImage = File(pickedFile.path);
      emit( SocialProfileCoverPeckerSuccessStates ());
    } else {
      print('No Image Selected!');
      emit(SocialProfileCoverPeckerErrorStates());
    }
  }



  void upLoudProfilImage({
    required String name,
    required String phone,
    required String email,
    required String bio,
  })
  {
    emit(SocialUserUpdateLoadingStates());
    firebase_storage.FirebaseStorage.instance.ref().child("users/${Uri.file(ProfileImage!.path).
    pathSegments.last}").putFile(ProfileImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUser(
          bio: bio,
          name: name,
          phone: phone,
          email: email,
          image: value,
        );

        //emit(SocialUpLoudProfileImageSuccessStates());
      }).catchError((e)
      {
        emit(SocialUpLoudProfileImageErrorStates());
      });
    }).catchError((e){

      emit(SocialUpLoudProfileImageErrorStates());
    });
  }



  void upLoudProfilCover({
    required String name,
    required String phone,
    required String email,
    required String bio,

  })
  {
    emit( SocialUserUpdateLoadingStates());
    firebase_storage.FirebaseStorage.instance.ref().
    child("users/${Uri.file(CoverImage!.path).
    pathSegments.last}").putFile(CoverImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUser(
          bio: bio,
          name: name,
          phone: phone,
          email: email,
          cover: value,
        );

        //emit(SocialUpLoudProfileCoverSuccessStates());
      }).catchError((e)
      {
        emit(SocialUpLoudProfileCoverErrorStates());
      });
    }).catchError((e){
      emit(SocialUpLoudProfileCoverErrorStates());
    });
  }


  void updateUser(
      { required String name,
        required String phone,
        required String email,
        required String bio,
        String? image,
        String? cover,})
  {
    UserModel model = UserModel(
      phone: phone,
      name: name,
      bio: bio,
      email: email,
      cover: cover ?? userModel?.cover,
      image: image?? userModel?.image,
      uId: userModel?.uId,
      isEmailVerified: false,

    );
    FirebaseFirestore.instance.collection("users").doc(userModel!.uId).update(model.toMap())
        .then((value)
    {
      getUserData();

    }).catchError((e)
    {
      emit(SocialUserUpdateErrorStates());
    });
  }

  final GoogleSignIn  _googleSignIn = GoogleSignIn();
  signOut ()  {
    emit(LogoutUsingGoogleLoadingStates());
    _googleSignIn.signOut().then((value) {
      emit(LogoutUsingGoogleSuccessStates());

    }).catchError((error){
      emit(LogoutUsingGoogleErrorStates(error));
    });

  }

}