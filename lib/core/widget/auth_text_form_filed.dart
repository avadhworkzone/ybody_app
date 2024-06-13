import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';

class AuthTextFormFiled extends StatelessWidget {
  const AuthTextFormFiled({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.textInputType,
    required this.validator,
    required this.prefixIcon,
    required this.hintText,
  });

  final TextEditingController controller;
  final bool obscureText;
  final TextInputType textInputType;
  final Function validator;
  final Widget prefixIcon;

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.right,
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      validator: (value) => validator(value),
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        contentPadding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 10.h),
        filled: true,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black45,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: const BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: const BorderSide(color: MyColors.colorRed),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: const BorderSide(color: MyColors.mainColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
