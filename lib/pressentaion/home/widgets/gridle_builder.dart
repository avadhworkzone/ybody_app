import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';

class gridle_builder extends StatelessWidget {
  const gridle_builder({
    super.key,
    required this.categoryImage,
    required this.category,
    required this.ontap,
  });

  final List categoryImage;
  final List<String> category;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 8,
      padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(40),
          left: ScreenUtil().setWidth(40),
          bottom: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: screenWidth(context) / (screenHeight(context) / 1.77),
        mainAxisSpacing: screenWidth(context) * 0.04,
        crossAxisSpacing: screenHeight(context) * 0.02,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: ontap,
        child: Container(
          height: 154.w,
          width: 145.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(129, 129, 129, 0.1),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  categoryImage.length > index ? categoryImage[index] : '',
                  height: 110.w,
                  width: 80.w,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  category.length > index ? category[index] : '',
                  style: TextStyle(
                    fontSize: 12.w,
                    fontWeight: FontWeight.w700,
                    color: MyColors.textColor,
                    fontFamily: (prefs.getString("lang") == "en")
                        ? 'Metropolis'
                        : 'Noto Naskh Arabic',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
