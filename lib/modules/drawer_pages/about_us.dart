import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
              left: 20,
              right: 20
          ),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: HexColor('#2888ff'),
                ),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        top: 10

                      ),
                      child: Text('About Us',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).scaffoldBackgroundColor,

                      ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: Text(
                          'The designers of this application are members of the NeuroAi team who specialize in the manufacture of software and embedded systems and the integration of artificial intelligence in them.'
                          '\nThe NeuroAi team, is a full-fledged team that pursues customer satisfaction and strives to help patients.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(child: Text('Team Members',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,
                color: HexColor('#2888ff'),),)),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 56,
                        backgroundImage: AssetImage('assets/images/Amr_Abdellatife.jpg'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                          'D\\ Amr Abdellatif',
                      style: TextStyle(
                        fontSize: 20,
                        color: HexColor('#2888ff'),
                      ),
                      ),
                    ],
                  ),
                  Spacer(),

                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 56,
                        backgroundImage: AssetImage('assets/images/sadat.jpg'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Ibrahim Elsadat',
                        style: TextStyle(
                            color: HexColor('#2888ff'),
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 56,
                        backgroundImage: AssetImage('assets/images/ahmed.jpg'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Ahmed Mohamed',
                        style: TextStyle(
                            color: HexColor('#2888ff'),
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),

                  Spacer(),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 56,
                        backgroundImage: AssetImage('assets/images/abanob.jpg'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Apanop Fekry',
                        style: TextStyle(
                            color: HexColor('#2888ff'),
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 56,
                        backgroundImage: AssetImage('assets/images/girl.png'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Ibthal Ahmed',
                        style: TextStyle(
                            color: HexColor('#2888ff'),
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),

                  Spacer(),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 56,
                        backgroundImage: AssetImage('assets/images/girl.png'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Heba Ahmed',
                        style: TextStyle(
                            color: HexColor('#2888ff'),
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 56,
                        backgroundImage: AssetImage('assets/images/ibrahim.jpg'),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Ibrahim Nashat',
                        style: TextStyle(
                          fontSize: 20,
                          color: HexColor('#2888ff'),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
