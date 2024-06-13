import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/constants.dart';

class buttomview extends StatelessWidget {
  const buttomview({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });
  final String text;
  final Color color;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120.h,
        height: 46.h,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(129, 129, 129, 0.1),
              spreadRadius: 5,
              blurRadius: 20,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: color,
              fontFamily:
                  (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic',
            ),
          ),
        ),
      ),
    );
  }
}
