import 'package:special_exam_app/bloc/main_cubit/main_states.dart';
import 'package:special_exam_app/bloc/main_cubit/mian_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:special_exam_app/shared/local/cach_helper/cach_helper.dart';

import '../../shared/constatnts/constants.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  bool updatedCover = true;
  bool updatedImage = true;
  bool isLoginUsingGoogle = cachHelper.getData(key: 'googleSignInOrNot');
  String nameOfTheUserFromGoogleAccount = cachHelper.getData(key: 'name');
  String emailOfTheUserFromGoogleAccount = cachHelper.getData(key: 'email');
  String photoOfTheUserFromGoogleAccount = cachHelper.getData(key: 'photo');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStutes>(
      listener: (context, state) {},
      builder: (context, state) {

        final model = SocialCubit.get(context).userModel;


        var image = model?.image;
        var cover = model?.cover;
        nameController.text = isLoginUsingGoogle ? nameOfTheUserFromGoogleAccount : model?.name??'loading..';
        bioController.text = isLoginUsingGoogle ? 'bio' : model?.bio??' bio';
        phoneController.text = isLoginUsingGoogle ? 'phone number' : model?.phone??'phone number';
        emailController.text = isLoginUsingGoogle ? emailOfTheUserFromGoogleAccount : model?.email??'loading..';
        var profileImage = SocialCubit.get(context).ProfileImage;
        var profileCover = SocialCubit.get(context).CoverImage;





        return Scaffold(
          backgroundColor: color2,
          appBar: AppBar(
            leading: IconButton(icon:Icon(Icons.arrow_back_ios_rounded),onPressed: (){
              Navigator.pop(context);
            },),
            actions: [
              isLoginUsingGoogle ? Container(): TextButton(
                onPressed: () {
                  SocialCubit.get(
                      context).updateUser(
                      name: nameController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                      bio: bioController.text,
                  );
                },
                child: SizedBox(
                  child: Text(
                    'تحديث',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: color1
                    ),
                  ),
                  width:22.w,
                ),

              )

            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 36.h,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 30.h,

                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    color: Colors.black12,
                                    image: DecorationImage(
                                        image: isLoginUsingGoogle ?
                                        AssetImage('assets/images/logo.png') :
                                        profileCover == null ?
                                        cover == 'assets/images/logo.png' ?
                                        AssetImage('$cover') as ImageProvider :
                                        NetworkImage('$cover') :
                                        FileImage(profileCover) ,
                                        fit: BoxFit.cover,
                                    ),
                                ),
                              ),
                              isLoginUsingGoogle ? Container() : IconButton(
                                  onPressed: (){
                                    updatedCover = false;
                                    SocialCubit.get(context).getCoverImage();
                                  },
                                  icon:CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.lightBlue.withOpacity(0.7),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                    ),
                                  )
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: isLoginUsingGoogle ? AlignmentDirectional.bottomCenter : AlignmentDirectional.bottomEnd,

                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 56,
                                backgroundColor: Colors.black12,
                                backgroundImage: isLoginUsingGoogle ?
                                NetworkImage('$photoOfTheUserFromGoogleAccount') :
                                profileCover == null ?
                                image == 'assets/images/logo.png' ?
                                AssetImage('$image') as ImageProvider :
                                NetworkImage('$image') :
                                FileImage(profileImage!) ,
                              ),
                            ),
                            isLoginUsingGoogle ? Container() : IconButton(
                                onPressed: (){
                                  updatedImage = false;
                                  SocialCubit.get(context).getProfileImage();
                                },
                                icon:CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.lightBlue.withOpacity(0.7),
                                  child: Icon(
                                      Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 2.h,
                  ),

                  Text(
                    isLoginUsingGoogle ? nameOfTheUserFromGoogleAccount :model?.name??'loading..',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: color3
                  ),
                  ),
                  Text(
                    isLoginUsingGoogle ?'':model?.bio??'loading..',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: color3
                  ),
                  ),

                 if(isLoginUsingGoogle == false)
                   SizedBox(
                     height: 6.h,
                   ),
                  if(isLoginUsingGoogle == false)
                    if (SocialCubit.get(context).CoverImage != null || SocialCubit.get(context).ProfileImage != null )
                    Row(
                      children: [
                        if(SocialCubit.get(context).CoverImage != null)

                          Expanded(
                            child:  Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: updatedCover==false ? OutlinedButton(
                                    onPressed: (){
                                      SocialCubit.get(context).upLoudProfilCover(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        email: emailController.text,
                                        bio: bioController.text,

                                      );

                                      setState(() {
                                        updatedCover = true;

                                      });

                                    },
                                    child: Text('Update Cover',
                                      style: TextStyle(
                                          fontSize: 18.sp
                                      ),
                                    ),
                                    style: OutlinedButton.styleFrom(

                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    ),
                                  ) : Container(),
                                ),
                                if(state is SocialUserUpdateLoadingStates)
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                if(state is SocialUserUpdateLoadingStates)
                                  LinearProgressIndicator(),
                              ],
                            ),
                          ),



                        SizedBox(
                          width: 2.w,
                        ),
                        if(SocialCubit.get(context).ProfileImage != null)

                          Expanded(
                            child:  Column(
                              children: [
                                updatedImage == false ? OutlinedButton(
                                  onPressed: (){
                                    SocialCubit.get(context).upLoudProfilImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      bio: bioController.text,
                                    );
                                    setState(() {
                                      updatedImage = true;
                                    });
                                  },
                                  child: Text('Update Image',
                                    style: TextStyle(
                                        fontSize: 18.sp
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: Size(100, 50),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                  ),
                                ) : Container(),
                                if(state is SocialUserUpdateLoadingStates)
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                if(state is SocialUserUpdateLoadingStates)
                                  LinearProgressIndicator(),
                              ],
                            ),
                          ),


                      ],
                    ),
                  if(isLoginUsingGoogle == false)
                    if (SocialCubit.get(context).CoverImage != null || SocialCubit.get(context).ProfileImage != null )


                    SizedBox(
                    height: 6.h,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: color3
                    ),
                    controller: nameController,
                    keyboardType: TextInputType.text,

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'من فضلك ادخل الاسم';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabled: isLoginUsingGoogle ? false : true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text('أسم المستخدم',
                        style: TextStyle(
                            color: color3
                        ),),
                      prefixIcon: Icon(
                        Icons.person,
                        color: color3,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(

                    style: TextStyle(
                        color: color3
                    ),
                    controller: bioController,
                    keyboardType: TextInputType.text,


                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'من فضل ادخل الوصف';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                     enabled: isLoginUsingGoogle ? false : true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),

                      ),
                      label: Text('الوصف',
                        style: TextStyle(
                            color: color3
                        ),),
                      prefixIcon: Icon(
                        Icons.info_outline,
                        color: color3,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    style: TextStyle(
                        color: color3
                    ),
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'من فضلك ادخل رقم الهاتف';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabled: isLoginUsingGoogle ? false : true,
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
                    height: 4.h,
                  ),
                  TextFormField(
                    style: TextStyle(
                        color: color3
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'من فضلك ادخل الايميل';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabled: isLoginUsingGoogle ? false : true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text('الايميل',
                      style: TextStyle(
                        color: color3
                      ),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: color3,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
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
