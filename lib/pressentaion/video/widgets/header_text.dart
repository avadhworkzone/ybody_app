import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/constants.dart';

import '../../../core/constant/colors.dart';

class HeaderpageText extends StatelessWidget {
  const HeaderpageText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 25.h,
        ),
        child: RichText(
          text: TextSpan(
            text: translateString('Select ', 'اختر ', 'هەڵبژاردن '),
            style: TextStyle(
              color: MyColors.mainColor,
              fontSize: 24.sp,
              fontFamily:
                  (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic',
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: translateString('M', 'ع', 'م'),
                style: TextStyle(
                  color: MyColors.colorBlack,
                  fontSize: 24.sp,
                  decoration: TextDecoration.underline,
                  decorationColor: MyColors.mainColor,
                  decorationThickness: 5,
                  fontFamily: (prefs.getString("lang") == "en")
                      ? 'Metropolis'
                      : 'Noto Naskh Arabic',
                  fontWeight: FontWeight.w400,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
              TextSpan(
                text: translateString('uscles', 'ضلات', 'دەرەکان'),
                style: TextStyle(
                  color: MyColors.colorBlack,
                  fontSize: 24.sp,
                  fontFamily: (prefs.getString("lang") == "en")
                      ? 'Metropolis'
                      : 'Noto Naskh Arabic',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ));
  }
}
