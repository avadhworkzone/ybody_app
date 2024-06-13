import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_fitness/pressentaion/video_player/video_player.dart';

class SuggestedVideos extends StatelessWidget {
  const SuggestedVideos({
    super.key,
    required this.text,
    required this.image,
  });
  final String text;
  final ImageProvider<Object> image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => VideosTraining(),
        //   ),
        // );
      },
      child: Container(
        width: 227.5.h,
        height: 151.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: image,
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Metropolis',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10),
              child: SvgPicture.asset('assets/images/Vector.svg',
                  fit: BoxFit.contain, height: 20.h, width: 20.w),
            ),
          ],
        ),
      ),
    );
  }
}
