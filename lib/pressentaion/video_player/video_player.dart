import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/widget/custom_app_bar.dart';
import 'package:x_fitness/models/muscles/MusclePartFile.dart';

class VideosTraining extends StatefulWidget {
  final MusclePartFile musclePartFile;

  const VideosTraining({super.key, required this.musclePartFile});
  @override
  State<VideosTraining> createState() => _VideosTrainingState();
}

class _VideosTrainingState extends State<VideosTraining> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer(widget.musclePartFile.path!);
    super.initState();
  }

  loadVideoPlayer(String url) {
    controller = VideoPlayerController.networkUrl(
        Uri.parse('https://dev.sanamedia.net/$url'));
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  int view = 0;
  @override
  Widget build(BuildContext context) {
    var file = widget.musclePartFile;
    return Scaffold(
      body: controller.value.isInitialized
          ? SingleChildScrollView(
              // scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                CustomAppBar(
                  text: file.title!,
                ),
                SizedBox(height: 35.h),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Container(
                        height: 190.h,
                        width: 346.h,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: VideoPlayer(controller),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 320.h,
                      child: AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                              ),
                              onPressed: () {
                                setState(() {
                                  controller.value.isPlaying
                                      ? controller.pause()
                                      : controller.play();
                                });
                              },
                              child: controller.value.isPlaying
                                  ? SvgPicture.asset(
                                      'assets/images/play.svg',
                                      width: 40,
                                      height: 40,
                                    )
                                  : Image.asset(
                                      'assets/images/play1.png',
                                      width: 60,
                                      height: 60,
                                    ))),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.h, vertical: 10),
                      child: Positioned(
                        child: Image.asset(
                          'assets/images/logoapp2video.png',
                          fit: BoxFit.contain,
                          width: 28,
                          height: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                // Padding(
                //   padding: EdgeInsets.only(right: 25.w, left: 25.w),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       buttomview(
                //         text: translateString(
                //             'Front view', 'الوجه الامامي', 'وەژەی ئەمەر'),
                //         color: view == 0 ? MyColors.colorBlack2 : Colors.grey,
                //         onTap: () {
                //           setState(() {
                //             view = 0;
                //           });
                //         },
                //       ),
                //       SizedBox(width: 20.h),
                //       buttomview(
                //         text: translateString(
                //             'side view', 'الوجه الجانبي', 'وەژەی جەنبی'),
                //         color: view == 1 ? MyColors.colorBlack2 : Colors.grey,
                //         onTap: () {
                //           setState(() {
                //             view = 1;
                //           });
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(right: 20.h, left: 20.h),
                  child: Container(
                    width: 310.h,
                    height: 179.h,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(129, 129, 129, 0.1),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset:
                              Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 13.h, vertical: 17.5.h),
                        child: Text(
                          file.description!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic',
                                ),
                              ),
                              ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.h, left: 20.h),
                  child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.mainColor,
                        borderRadius: BorderRadius.circular(10.w),
                        border: Border.all(
                          color: MyColors.mainColor,
                          width: 2,
                        ),
                      ),
                      height: 50.w,
                      child: Center(
                        child: Text(
                          '!! Place your ad here !!',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: MyColors.colorWhite,
                              fontFamily: (prefs.getString("lang") == "en")
                                  ? 'Metropolis'
                                  : 'Noto Naskh Arabic'),
                        ),
                      )),
                ),
                // SizedBox(
                //   height: 15.h,
                // ),
                // Padding(
                //   padding: EdgeInsets.only(right: 20.h, left: 20.h),
                //   child: Row(
                //     children: [
                //       Text(
                //         translateString(
                //             'Suggested', 'المقترح', 'پێشنیارییەکان'),
                //         style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 20.sp,
                //             fontWeight: FontWeight.w500,
                //             fontFamily: (prefs.getString("lang") == "en")
                //                 ? 'Metropolis'
                //                 : 'Noto Naskh Arabic'),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 14.h,
                // ),
                // SingleChildScrollView(
                //   physics: const BouncingScrollPhysics(),
                //   scrollDirection: Axis.horizontal,
                //   child: Padding(
                //     padding: EdgeInsets.only(right: 20.h, left: 20.h),
                //     child: Row(
                //       children: [
                //         SuggestedVideos(
                //           text: translateString('Shoulder Workout',
                //               'تمرين الكتف', ' چاوەڕێکی کەتەوە'),
                //           image: const AssetImage(
                //             'assets/images/unsplash_h4i9G-de7Po.png',
                //           ),
                //         ),
                //         SizedBox(
                //           width: 16.h,
                //         ),
                //         SuggestedVideos(
                //           text: translateString('Biseps Workout',
                //               'تمرين البيسبس', ' چاوەڕێکی بیسپس'),
                //           image: const AssetImage(
                //               'assets/images/unsplash_9dzWZQWZMdE.png'),
                //         ),
                //         SizedBox(
                //           width: 16.h,
                //         ),
                //         SuggestedVideos(
                //           text: translateString(
                //               'Arm Workout', 'تمرين الذراع', ' چاوەڕێکی زراع'),
                //           image: const AssetImage(
                //               'assets/images/unsplash_h4i9G-de7Po.png'),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20.h,
                ),
              ]),
            )
          : Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(
                  color: MyColors.mainColor,
                ),
              ),
            ),
    );
  }
}
