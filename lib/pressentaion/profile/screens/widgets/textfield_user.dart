import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_fitness/core/constant/constants.dart';

class textfiledUser extends StatelessWidget {
  const textfiledUser({
    super.key,
    required this.text,
    this.icon,
    this.icon2,
  });
  final String text;
  final dynamic icon;
  final dynamic icon2;
  // final SvgPicture? icon2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(20), left: ScreenUtil().setWidth(20)),
      child: Container(
        width: 270.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(129, 129, 129, 0.1),
              spreadRadius: 4,
              blurRadius: 20,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 11.w),
            Row(
              children: [
                SizedBox() ?? icon2,
                SizedBox(width: 10.w),
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: (prefs.getString("lang") == "en")
                        ? 'Metropolis'
                        : 'Noto Naskh Arabic',
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(width: 65.w),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: icon ?? icon,
              //  Image.asset(
              //     'assets/images/Frame 39908.png'),
            ),
          ],
        ),
      ),
    );
  }
}
