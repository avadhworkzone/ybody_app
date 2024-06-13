import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';

class namecityFilter extends StatelessWidget {
  final String cityname;
  final String cityname2;
  final dynamic image;
  const namecityFilter({
    super.key,
    required this.cityname,
    required this.cityname2,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: (prefs.getString("lang") == "en") ? 2.h : 2.h,
        left: (prefs.getString("lang") == "en") ? 20.w : 20.w,
        right: (prefs.getString("lang") == "en") ? 20.w : 20.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            cityname,
            style: TextStyle(
              color: MyColors.colorBlack2,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontFamily:
                  (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic',
            ),
          ),
          Container(child: image
              //  SvgPicture.asset('assets/images/aertss.svg'),
              ),
          Text(
            cityname2,
            style: TextStyle(
              color: MyColors.colorBlack2,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              fontFamily:
                  (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic',
            ),
          ),
          SvgPicture.asset('assets/images/aertss.svg'),
        ],
      ),
    );
  }
}
