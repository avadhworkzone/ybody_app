import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/pressentaion/home/widgets/cuoponText.dart';
import 'package:x_fitness/pressentaion/layout/layout.dart';

class CouponsScreen extends StatelessWidget {
  CouponsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Column(
        children: [
          SizedBox(height: 60.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              height: 550.h,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 70.h),
                    child: CouponCard(
                      shadow: const BoxShadow(
                        color: Color.fromARGB(255, 233, 230, 230),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                      height: (prefs.getString("lang") == "en") ? 430.h : 460.h,
                      width: 310.w,
                      curvePosition: 300.w,
                      curveRadius: 100.w,
                      borderRadius: 10.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      firstChild: Padding(
                        padding: EdgeInsets.only(top: 85.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Great!',
                              style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Great!',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                'Order Submitted',
                                style: TextStyle(
                                  color: MyColors.colorBlack,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 19.h),
                            customCouponText(
                              text2: '\$15',
                              text: 'Price:',
                            ),
                            customCouponText(
                              text2: '%5',
                              text: 'Discount:',
                            ),
                            customCouponText(
                              text2: '\$5',
                              text: 'Delivery Fee:',
                            ),
                            customCouponText(
                              text2: 'April 17, 2023',
                              text: 'Dated:',
                            ),
                          ],
                        ),
                      ),
                      secondChild: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              ' ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ ـ',
                              style: TextStyle(
                                color: MyColors.colorBlack,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              'Total Payment',
                              style: TextStyle(
                                fontFamily: (prefs.getString("lang") == "en")
                                    ? 'Metropolis'
                                    : 'Noto Naskh Arabic',
                                color: MyColors.colorgrey2,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '\$15',
                              style: TextStyle(
                                fontFamily: (prefs.getString("lang") == "en")
                                    ? 'Metropolis'
                                    : 'Noto Naskh Arabic',
                                color: MyColors.mainColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 80,
                      left: 80,
                      top: 0,
                      child: Image.asset('assets/images/Group 39894.png')),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 20.h),
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AppLayoutScreen()),
            );
          },
          child: Container(
              height: ScreenUtil().setHeight(48),
              width: ScreenUtil().setWidth(140),
              decoration: BoxDecoration(
                color: MyColors.mainColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: (prefs.getString("lang") == "en")
                          ? 'Metropolis'
                          : 'Noto Naskh Arabic',
                      fontWeight: FontWeight.w500),
                ),
              ) //Text('Total: \$ 0.00'),
              ),
        ),
      ),
    );
  }
}
