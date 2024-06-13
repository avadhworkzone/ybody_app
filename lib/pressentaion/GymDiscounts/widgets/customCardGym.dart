import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';

class customCardGyn extends StatelessWidget {
  const customCardGyn({
    super.key,
    required this.image,
    required this.GymName,
    required this.price,
    required this.time,
  });
  final String image;
  final String GymName;
  final String price;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        height: (prefs.getString("lang") == "en") ? 270.h : 300.h,
        width: 310.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.h),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(129, 129, 129, 0.1),
              spreadRadius: 0,
              blurRadius: 20,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              CachedNetworkImage(
                width: 310.h,
                height: 170.h,
                fit: BoxFit.fill,
                imageUrl:
                'https://dev.sanamedia.net/$image',
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
                placeholder: (
                    context,
                    url,
                    ) =>
                const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                    child: Text(
                      GymName,
                      style: TextStyle(
                          color: MyColors.colorBlack2,
                          fontSize: 16.sp,
                          fontFamily: (prefs.getString("lang") == "en")
                              ? 'Metropolis'
                              : 'Noto Naskh Arabic',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
                    child: Text(
                      'Starting Price',
                      style: TextStyle(
                          color: MyColors.colorBlack2.withOpacity(.5),
                          fontSize: 12.sp,
                          fontFamily: (prefs.getString("lang") == "en")
                              ? 'Metropolis'
                              : 'Noto Naskh Arabic',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/images/timer.svg'),
                        SizedBox(
                          width: 7.h,
                        ),
                        Text(
                          time,
                          // '9:00 AM - 12:00 PM',
                          style: TextStyle(
                              color: MyColors.colorBlack2.withOpacity(.5),
                              fontSize: 12.sp,
                              fontFamily: (prefs.getString("lang") == "en")
                                  ? 'Metropolis'
                                  : 'Noto Naskh Arabic',
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                    ),
                    child: Text(
                      '\$$price',
                      // '\$150',
                      style: TextStyle(
                          color: MyColors.mainColor,
                          fontSize: 24.sp,
                          fontFamily: (prefs.getString("lang") == "en")
                              ? 'Metropolis'
                              : 'Noto Naskh Arabic',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
