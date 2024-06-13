import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';

class ButtomSendOerder extends StatelessWidget {
  const ButtomSendOerder({
    super.key,
    required this.text1,
  });
  final String text1;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(48),
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text1,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily:
                    (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic',
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
