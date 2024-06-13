import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

List<String> images = [
  '',
  'assets/images/person.png',
];
int index = 0;

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedNoti = 0;
    return Scaffold(
        backgroundColor: MyColors.backgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 60.h),
            child: Container(
              child: Column(children: [
                Center(
                    child: Text(
                  translateString(
                      'Notifications', 'الاشعارات', 'ئاگادارییەکان'),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontFamily: (prefs.getString("lang") == "en")
                          ? 'Metropolis'
                          : 'Noto Naskh Arabic',
                      fontWeight: FontWeight.w700),
                )),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CutomButtom(
                        text: translateString(
                            'Clear all', 'مسح الكل', 'لادانی هەمووی'),
                      ),
                      CutomButtom(
                        text: translateString('Mark all as read',
                            'تعيين  الكل ك مقروء', 'نیشانکردن وەک خوێندراوە'),
                        // 'Mark all as read',
                      ),
                    ],
                  ),
                ),

                /// Workout Reminder
                Padding(
                  padding: EdgeInsets.only(right: 20.h, left: 20.h, top: 20.h),
                  child: Container(
                      // height: 70.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(129, 129, 129, 0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 44,
                            width: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selectedNoti == 0
                                  ? MyColors.mainColor
                                  : Colors.transparent,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      translateString('Workout Reminder',
                                          'تذكرة وقت التمرين', 'ئاگادارییەکان'),
                                      style: TextStyle(
                                          fontFamily:
                                              (prefs.getString("lang") == "en")
                                                  ? 'Metropolis'
                                                  : 'Noto Naskh Arabic',
                                          color: selectedNoti == 0
                                              ? MyColors.mainColor
                                              : Color.fromRGBO(
                                                  117, 117, 117, 1),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: screenWidth(context) * 0.09,
                                    ),
                                    Text(
                                      translateString('15 min ago',
                                          'منذ 15 دقيقة', '١٥ دەقە پێشووتر'),
                                      style: TextStyle(
                                          fontFamily:
                                              (prefs.getString("lang") == "en")
                                                  ? 'Metropolis'
                                                  : 'Noto Naskh Arabic',
                                          color: const Color.fromRGBO(
                                              117, 117, 117, 1),
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight(context) * 0.007,
                                ),
                                Text(
                                  translateString(
                                      'Lorem ipsum dolor sit amet\nconsectetur.asda Neque diam non\nlorem in donec laoreet dw saw',
                                      'نذكرك دائما بوقت التمرين في ال الميعاد المحدد',
                                      'ڕاهێنەرێکی پێشکەوتوو'),
                                  maxLines: 5,
                                  style: TextStyle(
                                      fontFamily:
                                          (prefs.getString("lang") == "en")
                                              ? 'Metropolis'
                                              : 'Noto Naskh Arabic',
                                      color: const Color.fromRGBO(
                                          117, 117, 117, 1),
                                      fontSize: 10.sp,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 20.h,
                    left: 20.h,
                  ),
                  child: Container(
                      // height: ScreenUtil().setHeight(70),
                      width: ScreenUtil().setHeight(300),
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(129, 129, 129, 0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 44,
                            width: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selectedNoti == 1
                                  ? MyColors.mainColor
                                  : Colors.transparent,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: Image.asset(
                              images.length > index ? images[1] : images[0],
                              height: 80,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 5.w, left: 5.w, top: 8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      translateString('meet Mohamed ',
                                          'كابتن محمد', 'محمد -ی ڕاهێنەر '),
                                      style: TextStyle(
                                          fontFamily:
                                              (prefs.getString("lang") == "en")
                                                  ? 'Metropolis'
                                                  : 'Noto Naskh Arabic',
                                          color: selectedNoti == 2
                                              ? MyColors.mainColor
                                              : Color.fromRGBO(
                                                  117, 117, 117, 1),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: screenWidth(context) * 0.07,
                                    ),
                                    Text(
                                        translateString('15 min ago',
                                            'منذ 15 دقيقة', '١٥ دەقە پێشووتر'),
                                        style: TextStyle(
                                            fontFamily:
                                                (prefs.getString("lang") ==
                                                        "en")
                                                    ? 'Metropolis'
                                                    : 'Noto Naskh Arabic',
                                            color: const Color.fromRGBO(
                                                117, 117, 117, 1),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight(context) * 0.007,
                                ),
                                Text(
                                  translateString(
                                      'Lorem ipsum dolor sit amet\nconsectetur.asda Neque diam non\nlorem in donec laoreet dw saw',
                                      'نذكرك دائما بوقت التمرين في ال الميعاد المحدد',
                                      'ڕاهێنەرێکی پێشکەوتوو '),
                                  maxLines: 5,
                                  style: TextStyle(
                                      fontFamily:
                                          (prefs.getString("lang") == "en")
                                              ? 'Metropolis'
                                              : 'Noto Naskh Arabic',
                                      color: const Color.fromRGBO(
                                          117, 117, 117, 1),
                                      fontSize: 10.sp,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 20.h,
                    left: 20.h,
                  ),
                  child: Container(
                      // height: ScreenUtil().setHeight(70),
                      width: ScreenUtil().setHeight(310),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(129, 129, 129, 0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 44,
                            width: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selectedNoti == 2
                                  ? MyColors.mainColor
                                  : Colors.transparent,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 10.w, left: 10.w, top: 8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      translateString(
                                          '50% off on suppliments',
                                          'خصم 50% علي المنتجات',
                                          ' ٥٠ ٪ داشکان لە تەواوکەرە خۆراکییەکان'),
                                      style: TextStyle(
                                          fontFamily:
                                              (prefs.getString("lang") == "en")
                                                  ? 'Metropolis'
                                                  : 'Noto Naskh Arabic',
                                          color: selectedNoti == 2
                                              ? MyColors.mainColor
                                              : Color.fromRGBO(
                                                  117, 117, 117, 1),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: screenWidth(context) * 0.02,
                                    ),
                                    Text(
                                        translateString('15 min ago',
                                            'منذ 15 دقيقة', '١٥ دەقە پێشووتر'),
                                        style: TextStyle(
                                            fontFamily:
                                                (prefs.getString("lang") ==
                                                        "en")
                                                    ? 'Metropolis'
                                                    : 'Noto Naskh Arabic',
                                            color: const Color.fromRGBO(
                                                117, 117, 117, 1),
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     RichText(
                                //       text: TextSpan(
                                //         text: '50% off on suppliments',
                                //         style: TextStyle(
                                //             color: selectedNoti == 2
                                //                 ? MyColors.mainColor
                                //                 : const Color.fromRGBO(
                                //                     117, 117, 117, 1),
                                //             fontSize: 16.sp,
                                //             fontFamily:
                                //                 (prefs.getString("lang") ==
                                //                         "en")
                                //                     ? 'Metropolis'
                                //                     : 'Noto Naskh Arabic',
                                //             fontWeight: FontWeight.bold),
                                //         children: <TextSpan>[
                                //           const TextSpan(
                                //               text: '',
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.bold)),
                                //           TextSpan(
                                //               text: '             1 hour ago',
                                //               style: TextStyle(
                                //                   fontFamily: (prefs.getString(
                                //                               "lang") ==
                                //                           "en")
                                //                       ? 'Metropolis'
                                //                       : 'Noto Naskh Arabic',
                                //                   color: const Color.fromRGBO(
                                //                       117, 117, 117, 1),
                                //                   fontSize: 10,
                                //                   fontWeight: FontWeight.bold)),
                                //         ],
                                //       ),
                                //     )
                                //   ],
                                // ),
                                SizedBox(
                                  height: screenHeight(context) * 0.007,
                                ),
                                Text(
                                  translateString(
                                      'Lorem ipsum dolor sit amet\nconsectetur.asda Neque diam non\nlorem in donec laoreet dw saw',
                                      'نذكرك دائما بوقت التمرين في ال الميعاد المحدد',
                                      'ڕاهێنەرێکی پێشکەوتوو'),
                                  maxLines: 5,
                                  style: TextStyle(
                                      fontFamily:
                                          (prefs.getString("lang") == "en")
                                              ? 'Metropolis'
                                              : 'Noto Naskh Arabic',
                                      color: const Color.fromRGBO(
                                          117, 117, 117, 1),
                                      fontSize: 10.sp,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                )
              ]),
            ),
          ),
        ));
  }
}

class CutomButtom extends StatelessWidget {
  const CutomButtom({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        text,
        style: TextStyle(
            fontFamily: (prefs.getString("lang") == "en")
                ? 'Metropolis'
                : 'Noto Naskh Arabic',
            color: MyColors.mainColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
