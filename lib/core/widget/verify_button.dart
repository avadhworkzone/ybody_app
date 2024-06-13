import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/widget/text_utils.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 25.w),
        backgroundColor: MyColors.colorRed,
      ),
      child: TextUtils(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        text: 'تأكيد',
        color: Colors.white,
        underLine: TextDecoration.none,
      ),
    );
  }
}
