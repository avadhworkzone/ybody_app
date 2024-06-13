import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/widget/custom_app_bar.dart';
import 'package:x_fitness/models/Coach.dart';

class CoachDescrption extends StatelessWidget {
  const CoachDescrption({super.key, required this.coach});
  final Coach coach;
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          CustomAppBar(
              text: translateString('Coach Information', 'تعريف المدرب', 'طزانیاری')),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Container(
              height: (prefs.getString("lang") == "en")
                  ? MediaQuery.of(context).size.height * 0.38
                  : MediaQuery.of(context).size.height * 0.46,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(129, 129, 129, 0.1),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: MyColors.colorWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0.h,
                      left: we * 0.02,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Image.network(
                                                'https://dev.sanamedia.net/${coach.profileImage}',
                                                    height: .4 * we,
                                                    width: ScreenUtil()
                                                        .setWidth(145.w),
                                                    fit: BoxFit.contain,
                                                  )));
                                    },
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      'https://dev.sanamedia.net/${coach.profileImage}',
                                      height: .4 * we,
                                      width: ScreenUtil().setWidth(145.w),
                                      fit: BoxFit.fill,
                                      errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                      placeholder: (
                                          context,
                                          url,
                                          ) =>
                                      const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                    ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              // Text(
                              //   translateString(
                              //       'Ratings', 'التقييم', 'هەڵسەنگاندن'),
                              //   style: TextStyle(
                              //       color: MyColors.colorgrey2,
                              //       fontSize: 12,
                              //       fontWeight: FontWeight.w500,
                              //       fontFamily:
                              //           (prefs.getString("lang") == "en")
                              //               ? 'Metropolis'
                              //               : 'Noto Naskh Arabic'),
                              // ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              // Text(
                              //   coach.experience ?? '',
                              //   style: TextStyle(
                              //       color: MyColors.colorBlack2,
                              //       fontSize: 16,
                              //       fontWeight: FontWeight.w700,
                              //       fontFamily:
                              //           (prefs.getString("lang") == "en")
                              //               ? 'Metropolis'
                              //               : 'Noto Naskh Arabic'),
                              // ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              // const Row(
                              //   children: [
                              //     Icon(
                              //       Icons.star,
                              //       color: MyColors.mainColor,
                              //       size: 26,
                              //     ),
                              //     Icon(
                              //       Icons.star,
                              //       color: MyColors.mainColor,
                              //       size: 26,
                              //     ),
                              //     Icon(
                              //       Icons.star,
                              //       color: MyColors.mainColor,
                              //       size: 26,
                              //     ),
                              //     Icon(
                              //       Icons.star,
                              //       color: MyColors.mainColor,
                              //       size: 26,
                              //     ),
                              //     Icon(
                              //       Icons.star,
                              //       color: MyColors.mainColor,
                              //       size: 26,
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              translateString('Name', 'الاسم', 'ناو'),
                              style: TextStyle(
                                  color: MyColors.colorgrey2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic'),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              coach.name!,
                              style: TextStyle(
                                  color: MyColors.colorBlack2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              translateString('Age', 'العمر', 'تەمەن'),
                              style: TextStyle(
                                  color: MyColors.colorgrey2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '${coach.age} Years',
                              style: TextStyle(
                                  color: MyColors.colorBlack2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              translateString(
                                  'Experience', 'خبرة المدرب', 'شارەزایی'),
                              style: TextStyle(
                                  color: MyColors.colorgrey2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '+${coach.experience}  Years',
                              style: TextStyle(
                                  color: MyColors.colorBlack2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              translateString(
                                  'Working at', 'يعمل لدي', 'کارکردن لە'),
                              style: TextStyle(
                                  color: MyColors.colorgrey2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Smart Gym',
                              style: TextStyle(
                                  color: MyColors.colorBlack2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              translateString(
                                  'Phone Number', 'رقم الهاتف', 'ژمارەی تەلەفۆن'),
                              style: TextStyle(
                                  color: MyColors.colorgrey2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              coach.phoneNumber!,
                              style: TextStyle(
                                  color: MyColors.colorBlack2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Container(
                height: ScreenUtil().setHeight(48),
                // width: ScreenUtil().setWidth(140),
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.colorgrey2),
                  color: MyColors.colorWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    translateString(
                        'Contact Info', 'معلومات التواصل', 'زانیاری پەیوەندی'),
                    style: TextStyle(
                        color: MyColors.colorBlack,
                        fontSize: 16.sp,
                        fontFamily: (prefs.getString("lang") == "en")
                            ? 'Metropolis'
                            : 'Noto Naskh Arabic',
                        fontWeight: FontWeight.w700),
                  ),
                ) //Text('Total: \$ 0.00'),
                ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Container(
                height: ScreenUtil().setHeight(48),
                // width: ScreenUtil().setWidth(140),
                decoration: BoxDecoration(
                  color: MyColors.mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    translateString(
                        'Make A Meal Plan', 'عمل خطة غذائية', 'پلانی خۆراک'),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: (prefs.getString("lang") == "en")
                            ? 'Metropolis'
                            : 'Noto Naskh Arabic',
                        fontWeight: FontWeight.w700),
                  ),
                ) //Text('Total: \$ 0.00'),
                ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Container(
                height: ScreenUtil().setHeight(48),
                // width: ScreenUtil().setWidth(140),
                decoration: BoxDecoration(
                  color: MyColors.mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    translateString('Make A Workout Plan', 'عمل خطة تمرين',
                        'پلانی ڕاهێنان'),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: (prefs.getString("lang") == "en")
                            ? 'Metropolis'
                            : 'Noto Naskh Arabic',
                        fontWeight: FontWeight.w700),
                  ),
                ) //Text('Total: \$ 0.00'),
                ),
          ),
        ]),
      ),
    );
  }
}
