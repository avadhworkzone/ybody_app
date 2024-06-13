import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/colors.dart';
import 'text_utils.dart';

class ResendOtpCodeForLogInScreen extends StatelessWidget {
  const ResendOtpCodeForLogInScreen({
    super.key,
    required this.onPressed,
  });
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed;
      },
      child: TextUtils(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        text: 'اعاده ارسال الرمز',
        color: MyColors.primaryText,
        underLine: TextDecoration.underline,
      ),
    );
  }
}
