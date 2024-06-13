// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';

class customCouponText extends StatelessWidget {
  customCouponText({
    super.key,
    required this.text,
    required this.text2,
  });
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 55.w, vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            // 'Price:',
            style: const TextStyle(
              color: MyColors.colorgrey2,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 30.w,
          ),
          Text(
            text2,
            // '\$15',
            style: TextStyle(
              color: MyColors.colorBlack,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily:
                  (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic',
            ),
          ),
        ],
      ),
    );
  }
}
