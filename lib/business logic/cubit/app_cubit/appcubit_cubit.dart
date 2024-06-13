import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/pressentaion/Basket/screens/basket.dart';
import 'package:x_fitness/pressentaion/home/screen/home_screen.dart';
import 'package:x_fitness/pressentaion/notification/screens/notifacation.dart';
import 'package:x_fitness/pressentaion/plan/plan.dart';
import 'package:x_fitness/pressentaion/profile/screens/profile.dart';
import 'dart:ui' as ui;
part 'appcubit_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppcubitInitial());
  static AppCubit get(context) => BlocProvider.of(context);
//=======================================================================================================================================================
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    Planscreen(),
    const NotificationsScreen(),
    BasketScreen(),
    ProfileScreen(),
  ];
  void changeBottom(int index) {
    currentIndex = index;
    emit((AppChangeBottomNavStates()));
  }

  //=======================================================================================================================================================
  bool isArabic = false;
  bool isEnglish = false;
  bool isKurds = false;
  void changeLanguage() {
    if (prefs.getString("lang") != null) {
      if (prefs.getString("lang") == "en") {
        isEnglish = true;
        isArabic = false;
        isKurds = false;
        emit(ChangeLanguageState());
      } else if (prefs.getString("lang") == "ar") {
        isEnglish = false;
        isArabic = true;
        isKurds = false;
        emit(ChangeLanguageState());
      } else {
        isEnglish = false;
        isArabic = false;
        isKurds = true;
        emit(ChangeLanguageState());
      }
    } else {
      if (Platform.localeName.split('_')[0] == "en") {
        isEnglish = true;
        isArabic = false;
        isKurds = false;
        emit(ChangeLanguageState());
      } else if (Platform.localeName.split('_')[0] == "ar") {
        isEnglish = false;
        isArabic = true;
        isKurds = false;
        emit(ChangeLanguageState());
      } else {
        isEnglish = false;
        isArabic = false;
        isKurds = true;
        emit(ChangeLanguageState());
      }
    }
    ui.window.scheduleFrame();
  }
}
