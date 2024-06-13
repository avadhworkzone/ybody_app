import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 50.0;

  const GradientAppBar(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: 50.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [MyColors.mainColor, MyColors.colorRed],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.3, 0.8),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
