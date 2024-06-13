import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/constants.dart';

class cardinfo extends StatelessWidget {
  const cardinfo({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });
  final String text1;
  final String text2;
  final String text3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.h, right: 20.h, top: 20.h, bottom: 18.h),
      child: Column(
        children: [
          Text(
            text1,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontFamily:
                  (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            text2,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontFamily:
                  (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic',
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Container(
              height: 1.h,
              width: 100.w,
              color: Colors.black.withOpacity(.2),
            ),
          ),
          Text(
            text3,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontFamily:
                  (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
