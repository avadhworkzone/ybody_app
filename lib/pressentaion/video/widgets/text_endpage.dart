import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/constants.dart';

class text_endpage extends StatelessWidget {
  const text_endpage({
    super.key,
    required this.text,
    required this.color,
  });
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Text(
          text,
          style: TextStyle(
              color: color,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily:
                  (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic'),
        ));
  }
}
