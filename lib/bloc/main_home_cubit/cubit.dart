import 'package:special_exam_app/bloc/main_home_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/home_pages/learn.dart';
import '../../modules/home_pages/home.dart';



class NeuroCubit extends Cubit<NeuroStates> {
  NeuroCubit() : super(NeuroInitialState());

  static NeuroCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  List<BottomNavigationBarItem> bottomNavItems = const [

    BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'الرئيسية'
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sort_by_alpha,
        ),
        label: 'تعلم'
    ),



  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NeuroBottomNavState());
  }

  List<Widget> screens =  [

    MainHomePage(),
    LearnPage(),
  ];




}