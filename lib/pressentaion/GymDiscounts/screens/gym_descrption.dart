import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/widget/custom_app_bar.dart';
import 'package:x_fitness/pressentaion/SupplementsCheckout/widgets/buttomsendorder.dart';

import '../../../models/Gym.dart';

class GymDescription extends StatefulWidget {
  const GymDescription({super.key, required this.gym});
  final Gym gym;
  @override
  State<GymDescription> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GymDescription> {

  @override
  Widget build(BuildContext context) {
    var gym = widget.gym;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Stack(
            children: [
              CachedNetworkImage(
                width: 310.h,
                height: 250.h,
                fit: BoxFit.fill,
                imageUrl:
                'https://dev.sanamedia.net/${gym.coverImage}',
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
              Positioned(
                top: 40.h,
                left: 0,
                right: 0,
                bottom: 140.h,
                child: const CustomAppBar(text: ''),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              width: ScreenUtil().setHeight(310.w),
              height: (prefs.getString("lang") == "en")
                  ? ScreenUtil().setHeight(360.h)
                  : ScreenUtil().setHeight(480.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(129, 129, 129, 0.1),
                    spreadRadius: 5,
                    blurRadius: 20,
                    // offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                    child: Text(
                      gym.nameEn!,
                      style: TextStyle(
                          color: MyColors.colorBlack,
                          fontSize: 24.sp,
                          fontFamily: (prefs.getString("lang") == "en")
                              ? 'Metropolis'
                              : 'Noto Naskh Arabic',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          gym.nameEn!,
                          style: TextStyle(
                              color: MyColors.colorgrey2,
                              fontSize: 16.sp,
                              fontFamily: (prefs.getString("lang") == "en")
                                  ? 'Metropolis'
                                  : 'Noto Naskh Arabic',
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          '\$${gym.price}',
                          // '\$150',
                          style: TextStyle(
                              color: MyColors.mainColor,
                              fontSize: 24.sp,
                              fontFamily: (prefs.getString("lang") == "en")
                                  ? 'Metropolis'
                                  : 'Noto Naskh Arabic',
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                    child: Text(
                      'Timings',
                      style: TextStyle(
                          color: MyColors.colorBlack,
                          fontSize: 16.sp,
                          fontFamily: (prefs.getString("lang") == "en")
                              ? 'Metropolis'
                              : 'Noto Naskh Arabic',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Opens at:',
                          style: TextStyle(
                              color: MyColors.colorgrey2,
                              fontSize: 16.sp,
                              fontFamily: (prefs.getString("lang") == "en")
                                  ? 'Metropolis'
                                  : 'Noto Naskh Arabic',
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          gym.openAt!,
                          // '\$150',
                          style: TextStyle(
                              color: MyColors.colorBlack,
                              fontSize: 16.sp,
                              fontFamily: (prefs.getString("lang") == "en")
                                  ? 'Metropolis'
                                  : 'Noto Naskh Arabic',
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Close at:',
                          style: TextStyle(
                              color: MyColors.colorgrey2,
                              fontSize: 16.sp,
                              fontFamily: (prefs.getString("lang") == "en")
                                  ? 'Metropolis'
                                  : 'Noto Naskh Arabic',
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          gym.closeAt!,
                          // '\$150',
                          style: TextStyle(
                              color: MyColors.colorBlack,
                              fontSize: 16.sp,
                              fontFamily: (prefs.getString("lang") == "en")
                                  ? 'Metropolis'
                                  : 'Noto Naskh Arabic',
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
                    child: Text(
                      'Address',
                      style: TextStyle(
                          color: MyColors.colorBlack,
                          fontSize: 16.sp,
                          fontFamily: (prefs.getString("lang") == "en")
                              ? 'Metropolis'
                              : 'Noto Naskh Arabic',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
                    child: Text(
                      gym.address!,
                      style: TextStyle(
                        color: MyColors.colorgrey2,
                        fontSize: 16.sp,
                        fontFamily: (prefs.getString("lang") == "en")
                            ? 'Metropolis'
                            : 'Noto Naskh Arabic',
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
                    child: Text(
                      'Contact',
                      style: TextStyle(
                          color: MyColors.colorBlack,
                          fontSize: 16.sp,
                          fontFamily: (prefs.getString("lang") == "en")
                              ? 'Metropolis'
                              : 'Noto Naskh Arabic',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
                    child: Text(
                      gym.phoneNumber!,
                      style: TextStyle(
                        color: MyColors.colorgrey2,
                        fontSize: 16.sp,
                        fontFamily: (prefs.getString("lang") == "en")
                            ? 'Metropolis'
                            : 'Noto Naskh Arabic',
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 40.w, right: 40.w, top: 20.h, bottom: 10),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  width: ScreenUtil().setHeight(310),
                  height: ScreenUtil().setHeight(48),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(117, 117, 117, 1)),
                    color: MyColors.colorWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                          color: MyColors.colorBlack,
                          fontSize: 16,
                          fontFamily: (prefs.getString("lang") == "en")
                              ? 'Metropolis'
                              : 'Noto Naskh Arabic',
                          fontWeight: FontWeight.w700),
                    ),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 20),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  color: Colors.transparent,
                  width: ScreenUtil().setHeight(310),
                  child: const ButtomSendOerder(
                    text1: 'Get Discount Code',
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
