import 'package:special_exam_app/layouts/main_home/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_home_cubit/cubit.dart';
import '../../bloc/main_home_cubit/states.dart';

import '../../shared/constatnts/constants.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NeuroCubit(),
      child: BlocConsumer<NeuroCubit,NeuroStates>(
       listener: (context , state){},
        builder:  (context, state){

          var cubit = NeuroCubit.get(context);



         return Scaffold(

           backgroundColor: color2,
            appBar: AppBar(


            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomNavItems,
              elevation: 10,
              backgroundColor: color2,

            ),
           drawer: Drawers(),


          );
        },
      ),
    );
  }
}
