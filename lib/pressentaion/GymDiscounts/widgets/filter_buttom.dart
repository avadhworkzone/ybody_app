import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/constants.dart';

class buttomFilert extends StatelessWidget {
  final String text;
  final Color color;
  final Color textcolor;
  final Color Bordercolor;
  final void Function()? onTap;
  const buttomFilert({
    super.key,
    required this.text,
    required this.color,
    required this.textcolor,
    required this.Bordercolor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: ScreenUtil().setHeight(24),
          width: ScreenUtil().setWidth(80),
          decoration: BoxDecoration(
            border: Border.all(
              color: Bordercolor,
              //  const Color.fromRGBO(117, 117, 117, 1)
            ),
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: textcolor,
                  fontSize: 16.sp,
                  fontFamily: (prefs.getString("lang") == "en")
                      ? 'Metropolis'
                      : 'Noto Naskh Arabic',
                  fontWeight: FontWeight.w500),
            ),
          ) //Text('Total: \$ 0.00'),
          ),
    );
  }
}
