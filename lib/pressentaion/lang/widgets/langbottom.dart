import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';

class LanguageBottom extends StatelessWidget {
  const LanguageBottom({
    super.key,
    required this.color,
    required this.flag,
    required this.arrow,
    required this.text,
    required this.FontFamily,
  });
  final Color color;
  final String text;
  final Image flag;
  final dynamic arrow;
  final dynamic FontFamily;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 40.w,
        right: 40.w,
        top: 10.h,
        bottom: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        height: 63,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: flag,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: MyColors.textColor,
                  fontFamily: FontFamily),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: arrow,
            ),
          ],
        ),
      ),
    );
  }
}
