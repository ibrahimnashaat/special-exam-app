
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../shared/constatnts/constants.dart';
import '../../shared/constatnts/contactus.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);


  @override
  State<Contact> createState() => _ContactUsState();
}

class _ContactUsState extends State<Contact> {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(

      appBar: AppBar(),
      bottomNavigationBar: ContactUsBottomAppBar(
        companyName: 'علمني',
        textColor:color3.withOpacity(0.5),
        backgroundColor: color2,
        email: 'elprofmahmoud67@gmail.com',

      ),
      backgroundColor: color2,
      body: ContactUs(

        cardColor:color3.withOpacity(0.3),
        textColor: Theme.of(context).scaffoldBackgroundColor,
        logo: AssetImage('assets/images/logo.png',),
        avatarRadius: 10.h,
        email: 'elprofmahmoud67@gmail.com',
        companyName: 'علمني',

        companyColor: color2,
        dividerThickness: 2,

        tagLine: 'تواصل مع فريق العمل ',
        taglineColor: color3.withOpacity(0.5),
      ),

    );
  }
}
