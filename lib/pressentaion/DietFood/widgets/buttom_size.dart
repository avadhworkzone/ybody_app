import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/constants.dart';

class cutomButtomSize extends StatefulWidget {
  const cutomButtomSize({
    super.key,
    required this.text,
    required this.colorContiner,
    required this.colortext,
    this.onTap,
    this.Bordercolor,
  });
  final String text;
  final Color colorContiner;
  final Color colortext;
  final Color? Bordercolor;
  final Function()? onTap;

  @override
  State<cutomButtomSize> createState() => _cutomButtomSizeState();
}

class _cutomButtomSizeState extends State<cutomButtomSize> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        top: 11,
      ),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            border: Border.all(color: widget.Bordercolor ?? Colors.transparent),
            color: widget.colorContiner,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.colortext,
                fontSize: 16.sp,
                fontFamily:
                    (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic',
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
