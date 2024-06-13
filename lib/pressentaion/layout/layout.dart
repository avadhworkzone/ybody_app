import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_fitness/business%20logic/cubit/app_cubit/appcubit_cubit.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/helper/assets.dart';

class AppLayoutScreen extends StatefulWidget {
  const AppLayoutScreen({super.key, this.index});
  final int? index;
  @override
  State<AppLayoutScreen> createState() => _AppLayoutScreenState();
}

class _AppLayoutScreenState extends State<AppLayoutScreen> {
  int currentIndex = 0;
  int counter = 0;
  gatScreen() {
    if (widget.index != null) {
      setState(() {
        currentIndex = widget.index!;
      });
    } else {
      setState(() {
        currentIndex = 0;
      });
    }
  }

  // @override
  // void initState() {
  //   gatScreen();
  //   AppCubit.get(context).changeLanguage();
  //   super.initState();
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gatScreen();
    AppCubit.get(context).changeLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: SizedBox(
              height: 60.h,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  selectedLabelStyle: TextStyle(
                    color: MyColors.colorBlack2,
                    fontSize: (prefs.getString("lang") == "en") ? 10.sp : 8.sp,
                    fontFamily: (prefs.getString("lang") == "en")
                        ? 'Metropolis'
                        : 'Noto Naskh Arabic',
                    fontWeight: FontWeight.w400,
                  ),
                  type: BottomNavigationBarType.fixed,
                  fixedColor: MyColors.textColor,
                  iconSize: 20.w,
                  selectedFontSize:
                      (prefs.getString("lang") == "en") ? 10.sp : 8.sp,
                  unselectedFontSize:
                      (prefs.getString("lang") == "en") ? 10.sp : 8.sp,
                  backgroundColor: Colors.white,
                  onTap: (index) {
                    cubit.changeBottom(index);
                  },
                  currentIndex: cubit.currentIndex,
                  items: [
                    BottomNavigationBarItem(
                      label: translateString("Home", "الرئيسية", "سەرەتا"),
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          cubit.currentIndex == 0
                              ? AssetsData.HOME
                              : 'assets/images/home.svg',
                          height: 25.0,
                          width: 20.w,
                          color: cubit.currentIndex == 0
                              ? MyColors.mainColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          cubit.currentIndex == 1
                              ? AssetsData.PLAN
                              : 'assets/images/plan.svg',
                          height: 25.0,
                          width: 20.w,
                          color: cubit.currentIndex == 1
                              ? MyColors.mainColor
                              : Colors.grey,
                        ),
                      ),
                      label: translateString("My Plans", "خطتي", 'پلانەکانم'),
                    ),
                    BottomNavigationBarItem(
                      label: translateString(
                          "NOTIFICATION", "الاشعارات", "ئاگادارییەکان"),
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                                cubit.currentIndex == 2
                                    ? AssetsData.NOTIFICATION
                                    : 'assets/images/notification_fill.svg',
                                // height: 25.0,
                                height: 25.0,
                                width: 20.w,
                                fit: BoxFit.cover,
                                color: cubit.currentIndex == 2
                                    ? MyColors.mainColor
                                    : Colors.grey),
                            Positioned(
                              top: 0,
                              left: 11,
                              child: Container(
                                height: 10.0,
                                width: 10.w,
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: cubit.currentIndex == 2
                                      ? Colors.transparent
                                      : MyColors.mainColor,
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 12,
                                  minHeight: 12,
                                ),
                                child: const Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: translateString("BASKET", "السلة", "سەبەتە"),
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                                cubit.currentIndex == 3
                                    ? AssetsData.BASKET
                                    : AssetsData.BASKETFill,
                                height: 25.0,
                                width: 23.w,
                                color: cubit.currentIndex == 3
                                    ? MyColors.mainColor
                                    : Colors.grey),
                            Positioned(
                              top: 0,
                              left: 11,
                              child: Container(
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: cubit.currentIndex == 3
                                      ? Colors.transparent
                                      : MyColors.mainColor,
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 12,
                                  minHeight: 12,
                                ),
                                child: const Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: translateString("Profile", "الحساب", "پڕۆفایل"),
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                            cubit.currentIndex == 4
                                ? AssetsData.Profile
                                : 'assets/images/profile.svg',
                            fit: BoxFit.cover,
                            // height: 25.0,
                            height: 25.0,
                            width: 20.w,
                            color: cubit.currentIndex == 4
                                ? MyColors.mainColor
                                : Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
