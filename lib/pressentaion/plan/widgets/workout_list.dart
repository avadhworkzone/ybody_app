// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/pressentaion/video/video_screen.dart';

class List_Of_workout extends StatelessWidget {
  const List_Of_workout({
    super.key,
    required this.images,
    required this.names,
  });

  final List<String> images;
  final List<String> names;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: EdgeInsets.only(bottom: 15.h, left: 30.w, right: 25.w),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VideoScreen()));
          },
          child: Container(
              // height: 129,
              width: 310.w,
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(129, 129, 129, 0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Image.asset(
                      images[index],
                      height: 90.h,
                      width: 42.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20.w,
                      left: 20.w,
                    ),
                    child: Column(
                      children: [
                        Text(
                          names[index],
                          style: TextStyle(
                            fontFamily: (prefs.getString("lang") == "en")
                                ? 'Metropolis'
                                : 'Noto Naskh Arabic',
                            color: MyColors.colorBlack2,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          translateString(
                            'Lorem ipsum dolor sit \n amet consectetur.\n Arcu vulputate venenatis\n senectus scelerisque.\n At varius nunc dui \n viverra velit.',
                            'هذ التمرين مفيد جدا \n ويمكنك متابعه\, باقي التمارين ويمكنك \nالالتزام معنا دئما',
                            'هذ التمرين مفيد جدا  \nويمكنك متابعه باقي التمارين\n ويمكنك الالتزام معنا دئما',
                          ),
                          maxLines: 5,
                          style: TextStyle(
                              fontFamily: (prefs.getString("lang") == "en")
                                  ? 'Metropolis'
                                  : 'Noto Naskh Arabic',
                              color: const Color.fromRGBO(117, 117, 117, 1),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MyColors.mainColor,
                        ),
                        height: 48.h,
                        width: 48.w,
                        child: Padding(
                          padding: EdgeInsets.all(8.0.h),
                          child: SvgPicture.asset('assets/images/Vector.svg',
                              fit: BoxFit.contain, height: 20.h, width: 20.w),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
