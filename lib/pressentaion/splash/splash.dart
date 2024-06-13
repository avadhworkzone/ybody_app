import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:lottie/lottie.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/pressentaion/lang/lang_screen.dart';
import 'package:x_fitness/pressentaion/layout/layout.dart';
import 'package:x_fitness/utils/local_storage.dart';
import 'package:x_fitness/utils/shared_preference/shared_preference_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  dynamic getDataNext;
  void getData() async {
    var data = await getDataFromLocalStorage(
        dataType: LocalStorage.boolType, prefKey: LocalStorage.next);

    if (data != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const AppLayoutScreen()));
      });

      // ignore: use_build_context_synchronously
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const LanguageScreen()));
      });
    }
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Center(
          child: GifView.asset(
        'assets/gif/splash.gif',
        height: 200,
        width: 200,
      )

          // child: Image.asset("assets/images/app_logo.png"),
          ),
    );
  }
}
