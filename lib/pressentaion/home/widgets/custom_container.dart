// ignore_for_file: camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';

class customContainer extends StatelessWidget {
  const customContainer({
    super.key,
    required this.image,
    required this.title,
    this.ontap,
  });
  final String image;
  final String title;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: ontap,
      child: Stack(
        children: [
          Container(
            height: .21 * height,
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
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            child: CachedNetworkImage(
              height: 120.w,
              width: 145.w,
              fit: BoxFit.cover,
              imageUrl: image,
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
              placeholder: (
                  context,
                  url,
                  ) =>
              const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFe7002b),
                ),
              ),
            ),
          ),
          Positioned(
            // ignore: sort_child_properties_last
            child: Padding(
              padding: const EdgeInsets.only(bottom:0.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: MyColors.textColor,
                  fontFamily: (prefs.getString("lang") == "en")
                      ? 'Metropolis'
                      : 'Noto Naskh Arabic',
                ),
              ),
            ),
            bottom: .02 * height,
            left: (prefs.getString("lang") == "en") ? .04 * width : .06 * width,
            right:
                (prefs.getString("lang") == "en") ? .04 * width : .06 * width,
          )
        ],
      ),
    );
  }
}
