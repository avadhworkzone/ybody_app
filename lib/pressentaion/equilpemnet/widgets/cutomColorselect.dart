import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class cutomButtomSizeSelect extends StatefulWidget {
  const cutomButtomSizeSelect({
    super.key,
    required this.colorContiner,
    this.onTap,required this.isSelcted,
  });

  final Color colorContiner;
  final bool isSelcted;
  final Function()? onTap;

  @override
  State<cutomButtomSizeSelect> createState() => _cutomButtomSizeState();
}

class _cutomButtomSizeState extends State<cutomButtomSizeSelect> {
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
          width: widget.isSelcted ? 50.w : 40.w,
          height: widget.isSelcted ? 50.h : 40.h,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            color: widget.colorContiner,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
