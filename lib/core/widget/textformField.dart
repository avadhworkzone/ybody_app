// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.isPassword,
    this.inputType,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.backgroundColor,
    this.onEditingComplete,
    this.maxLines,
    this.label,
    this.controller,
    this.suffix,
    this.suffixPressed,
    this.prefix,
    this.hint,
    this.validator,
    this.borderColor,
    this.textAlign,
    this.suffixColor,
  }) : super(key: key);
  final TextEditingController? controller;

  final TextInputType? inputType;
  final ValueSetter? onChanged;
  final ValueSetter? onSaved;
  final FocusNode? focusNode;
  final int? maxLines;
  final Color? borderColor;
  final Color? suffixColor;
  final Color? backgroundColor;
  final String? label;
  final String? hint;
  final TextAlign? textAlign;
  final bool? isPassword;
  final Widget? suffix;
  final Widget? prefix;

  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  final Function? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword ?? false,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines ?? 1,
      onEditingComplete: onEditingComplete,
      cursorColor: MyColors.mainColor,
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        labelStyle: headingStyle.copyWith(
            color: Colors.black, fontWeight: FontWeight.w500),
        hintText: hint,
        hintStyle: headingStyle.copyWith(
            fontSize: (prefs.getString("lang") == "en")
                ? screenWidth(context) * 0.04
                : screenWidth(context) * 0.05,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: (borderColor != null) ? borderColor! : Colors.transparent),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.09),
        ),
        // ignore: prefer_if_null_operators
        suffixIcon: suffix != null ? suffix : null,
        prefixIcon: (prefix != null)
            ? Padding(
                padding: EdgeInsetsDirectional.only(
                    end: MediaQuery.of(context).size.width * 0.01),
                child: prefix,
              )
            : null,
        filled: true,
        fillColor: backgroundColor ?? MyColors.textFeildColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: (borderColor != null) ? borderColor! : Colors.transparent),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.09),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: (borderColor != null) ? borderColor! : Colors.transparent),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.09),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    Key? key,
    this.isPassword,
    this.inputType,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.onEditingComplete,
    this.maxLines,
    this.label,
    this.controller,
    this.suffix,
    this.suffixPressed,
    this.prefix,
    this.hint,
    this.validator,
    this.borderColor,
    this.fillColor,
  }) : super(key: key);
  final TextEditingController? controller;

  final TextInputType? inputType;
  final ValueSetter? onChanged;
  final ValueSetter? onSaved;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? label;
  final String? hint;
  final bool? isPassword;
  final String? suffix;
  final Widget? prefix;
  final Color? borderColor;
  final Color? fillColor;

  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  final Function? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword ?? false,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines ?? 1,
      onEditingComplete: onEditingComplete,
      cursorColor: MyColors.mainColor,
      decoration: InputDecoration(
        labelStyle: headingStyle.copyWith(
            color: Colors.black, fontWeight: FontWeight.w500),
        hintText: hint,
        hintStyle: headingStyle.copyWith(
            fontSize: (prefs.getString("lang") == "en")
                ? screenWidth(context) * 0.04
                : screenWidth(context) * 0.05,
            color: MyColors.textColor,
            fontWeight: FontWeight.w600),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: (borderColor != null) ? borderColor! : Colors.transparent),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Image.asset(
                  suffix!,
                  color: MyColors.colorRed,
                ))
            : null,
        prefixIcon: prefix,
        filled: true,
        fillColor: (fillColor != null) ? fillColor : Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: (borderColor != null) ? borderColor! : Colors.transparent),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: (borderColor != null) ? borderColor! : Colors.transparent),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////

class ResetPasswordTextFeild extends StatelessWidget {
  const ResetPasswordTextFeild({
    Key? key,
    this.isPassword,
    this.inputType,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.onEditingComplete,
    this.maxLines,
    this.label,
    this.controller,
    this.suffix,
    this.suffixPressed,
    this.prefix,
    this.hint,
    this.validator,
    this.borderColor,
  }) : super(key: key);
  final TextEditingController? controller;

  final TextInputType? inputType;
  final ValueSetter? onChanged;
  final ValueSetter? onSaved;
  final FocusNode? focusNode;
  final int? maxLines;
  final Color? borderColor;
  final String? label;
  final String? hint;
  final bool? isPassword;
  final String? suffix;
  final Widget? prefix;

  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  final Function? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword ?? false,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines ?? 1,
      onEditingComplete: onEditingComplete,
      cursorColor: MyColors.mainColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        labelStyle: headingStyle.copyWith(
            color: Colors.black, fontWeight: FontWeight.w500),
        hintText: hint,
        hintStyle: headingStyle.copyWith(
            fontSize: (prefs.getString("lang") == "en")
                ? screenWidth(context) * 0.04
                : screenWidth(context) * 0.045,
            color: MyColors.textColor,
            fontWeight: FontWeight.w600),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.09),
        ),
        suffixIcon: suffix != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 1,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      suffix!,
                      width: MediaQuery.of(context).size.width * 0.06,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            : null,
        prefixIcon: (prefix != null)
            ? Padding(
                padding: EdgeInsetsDirectional.only(
                    end: MediaQuery.of(context).size.width * 0.01),
                child: prefix,
              )
            : null,
        filled: true,
        fillColor: MyColors.textFeildColor,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.09),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.09),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class ForgetPasswordTextField extends StatelessWidget {
  const ForgetPasswordTextField({
    Key? key,
    this.isPassword,
    this.inputType,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.onEditingComplete,
    this.maxLines,
    this.label,
    this.controller,
    this.suffix,
    this.suffixPressed,
    this.prefix,
    this.hint,
    this.validator,
    this.borderColor,
  }) : super(key: key);
  final TextEditingController? controller;

  final TextInputType? inputType;
  final ValueSetter? onChanged;
  final ValueSetter? onSaved;
  final FocusNode? focusNode;
  final int? maxLines;
  final Color? borderColor;
  final String? label;
  final String? hint;
  final bool? isPassword;
  final String? suffix;
  final Widget? prefix;

  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  final Function? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword ?? false,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines ?? 1,
      onEditingComplete: onEditingComplete,
      cursorColor: MyColors.mainColor,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelStyle: headingStyle.copyWith(
            color: Colors.black, fontWeight: FontWeight.w500),
        hintText: hint,
        hintStyle: headingStyle.copyWith(
            fontSize: (prefs.getString("lang") == "en")
                ? screenWidth(context) * 0.04
                : screenWidth(context) * 0.045,
            color: MyColors.textColor,
            fontWeight: FontWeight.bold),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.09),
        ),
        suffixIcon: suffix != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 0,
                  child: CircleAvatar(
                    radius: screenWidth(context) * 0.04,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      suffix!,
                      width: MediaQuery.of(context).size.width * 0.06,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            : null,
        prefixIcon: (prefix != null)
            ? Padding(
                padding: EdgeInsetsDirectional.only(
                    end: MediaQuery.of(context).size.width * 0.01),
                child: prefix,
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.09),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.09),
        ),
      ),
    );
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////

class AddAdsInfoText extends StatelessWidget {
  const AddAdsInfoText({
    Key? key,
    this.isPassword,
    this.inputType,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.backgroundColor,
    this.onEditingComplete,
    this.maxLines,
    this.label,
    this.controller,
    this.suffix,
    this.suffixPressed,
    this.prefix,
    this.hint,
    this.validator,
    this.borderColor,
    this.textAlign,
    this.suffixColor,
  }) : super(key: key);
  final TextEditingController? controller;

  final TextInputType? inputType;
  final ValueSetter? onChanged;
  final ValueSetter? onSaved;
  final FocusNode? focusNode;
  final int? maxLines;
  final Color? borderColor;
  final Color? suffixColor;
  final Color? backgroundColor;
  final String? label;
  final String? hint;
  final TextAlign? textAlign;
  final bool? isPassword;
  final Widget? suffix;
  final Widget? prefix;

  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  final Function? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword ?? false,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines ?? 1,
      onEditingComplete: onEditingComplete,
      cursorColor: MyColors.mainColor,
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        labelStyle: headingStyle.copyWith(
            color: Colors.black, fontWeight: FontWeight.w500),
        hintText: hint,
        hintStyle: headingStyle.copyWith(
            fontSize: (prefs.getString("lang") == "en")
                ? screenWidth(context) * 0.04
                : screenWidth(context) * 0.05,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: (borderColor != null) ? borderColor! : Colors.transparent),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
        ),
        // ignore: prefer_if_null_operators
        suffixIcon: suffix != null ? suffix : null,
        prefixIcon: (prefix != null)
            ? Padding(
                padding: EdgeInsetsDirectional.only(
                    end: MediaQuery.of(context).size.width * 0.01),
                child: prefix,
              )
            : null,
        filled: true,
        fillColor: backgroundColor ?? MyColors.textFeildColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: (borderColor != null) ? borderColor! : Colors.transparent),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: (borderColor != null) ? borderColor! : Colors.transparent),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
        ),
      ),
    );
  }
}
