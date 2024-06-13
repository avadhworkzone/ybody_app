// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/pressentaion/plan/widgets/workout_list.dart';

class Planscreen extends StatefulWidget {
  Planscreen({super.key});

  @override
  State<Planscreen> createState() => _PlanscreenState();
}

class _PlanscreenState extends State<Planscreen> {
  List<String> images = [
    'assets/images/bisep 2.png',
    'assets/images/abdomen 1.png',
    'assets/images/back 2.png',
  ];

  List<String> names = [
    translateString('Biceps Workout', 'تمرين البايسبس', 'بیسپس تمرین'),
    translateString('Abdoen Workout', 'تمرين الادوم', 'ادوم تمرین'),
    translateString('Back Workout', 'تمرين الخلف', ' خلف تمرین'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.backgroundColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(top: 60.h),
              child: Column(children: [
                Center(
                    child: Text(
                  translateString('My Plans', 'خطتي', 'پلانەکانم'),
                  style: TextStyle(
                      color: MyColors.colorBlack2,
                      fontFamily: (prefs.getString("lang") == "en")
                          ? 'Metropolis'
                          : 'Noto Naskh Arabic',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                )),
                List_Of_workout(images: images, names: names),
              ]),
            ),
          ),
        ));
  }
}
