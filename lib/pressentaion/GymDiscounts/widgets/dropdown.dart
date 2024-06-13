import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';

class dropdownButtom extends StatefulWidget {
  const dropdownButtom({
    super.key,
    required this.text1,
    required this.text2,
    this.onpressed,
    required this.color,
    required this.width1,
  });
  final String text1;
  final int width1;
  final String text2;
  final Function()? onpressed;
  final Color color;

  @override
  State<dropdownButtom> createState() => _dropdownButtomState();
}

class _dropdownButtomState extends State<dropdownButtom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpressed,
      child: Container(
        height: 32.h,
        width: 90.w,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(129, 129, 129, 0.1),
              spreadRadius: 0,
              blurRadius: 7,
            ),
          ],
          borderRadius: BorderRadius.circular(10.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text(
                widget.text1,
                style: TextStyle(
                    color: MyColors.colorBlack,
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                    fontFamily: (prefs.getString("lang") == "en")
                        ? 'Metropolis'
                        : 'Noto Naskh Arabic'),
              ),
            ),
            Container(
              height: 15.h,
              width: widget.width1.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color,
              ),
              child: Center(
                  child: Text(
                widget.text2,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: (prefs.getString("lang") == "en")
                        ? 'Metropolis'
                        : 'Noto Naskh Arabic'),
              )),
            ),
            const Center(
              child: Icon(
                Icons.arrow_drop_down,
                color: MyColors.colorBlack2,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
