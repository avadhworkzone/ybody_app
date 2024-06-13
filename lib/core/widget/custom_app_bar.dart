import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
  });
  final dynamic text;
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: .06 * we),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              height: 40.h,
              width: 45.w,
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
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: MyColors.colorBlack2,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    (prefs.getString("lang") == "kr") ? .19 * we : .16 * we),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: MyColors.colorBlack2,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: (prefs.getString("lang") == "en")
                        ? 'Metropolis'
                        : 'Noto Naskh Arabic'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
