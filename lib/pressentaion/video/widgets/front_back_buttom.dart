import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/constants.dart';

class front_back_buttom extends StatelessWidget {
  const front_back_buttom({
    super.key,
    required this.text,
    this.onpressed,
    required this.color,
  });
  final String text;
  final VoidCallback? onpressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: 48.h,
        width: 83.h,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(129, 129, 129, 0.1),
              spreadRadius: 0,
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
                color: color,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                fontFamily:
                    (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic'),
          ),
        ),
      ),
    );
  }
}
