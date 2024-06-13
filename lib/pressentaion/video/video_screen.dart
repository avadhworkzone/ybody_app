import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/widget/custom_app_bar.dart';
import 'package:x_fitness/core/widget/custom_error_screen.dart';
import 'package:x_fitness/core/widget/custom_loading_indicator.dart';
import 'package:x_fitness/models/muscles/Muscle.dart';
import 'package:x_fitness/pressentaion/video/manager/all_muscles_cubit/all_muscles_cubit.dart';
import 'package:x_fitness/pressentaion/video/manager/muscle_files_cubit/muscles_files_cubit.dart';
import 'package:x_fitness/pressentaion/video/widgets/front_back_buttom.dart';
import 'package:x_fitness/pressentaion/video/widgets/header_text.dart';
import 'package:x_fitness/pressentaion/video/widgets/text_endpage.dart';
import 'package:x_fitness/pressentaion/video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  int _isPartSelected = 1;
  int _isSelected = 1;
  int _isFile = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: BlocConsumer<AllMusclesCubit, AllMusclesState>(
        listener: (context, state) {
          if (state is MusclesSuccess) {
            BlocProvider.of<MusclesFilesCubit>(context).getMusclesFiles(
                muscleId: _isSelected, partId: _isPartSelected);
          }
        },
        builder: (context, state) {
          if (state is MusclesSuccess) {
            List<Muscle> muscles = state.muscles;
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    CustomAppBar(
                      text: translateString('Training videos',
                          'فيديوهات التدريب', '    ڤیدیۆی ڕاهێنان'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.h),
                      child: const HeaderpageText(),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                  ],
                )),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 48.h,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 30.h),
                        itemCount: muscles[_isSelected].parts!.length,
                        separatorBuilder: (context, index) => SizedBox(
                              width: 20.h,
                            ),
                        itemBuilder: (context, index) {
                          var musclePart = muscles[_isSelected].parts![index];
                          return front_back_buttom(
                            text: musclePart.title!,
                            onpressed: () {
                              setState(() {
                                _isPartSelected = index;
                                _isFile = 0;
                              });
                              BlocProvider.of<MusclesFilesCubit>(context).getMusclesFiles(
                                  muscleId: muscles[_isSelected].id!, partId: musclePart.id!);
                            },
                            color: _isPartSelected == index
                                ? MyColors.colorBlack2
                                : Colors.grey,
                          );
                        }),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          children: [
                            Container(
                              height: 380.h,
                              width: 150.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      'https://dev.sanamedia.net/${muscles[_isSelected].parts![_isPartSelected].coverImage}'),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(129, 129, 129, 0.1),
                                    spreadRadius: 0,
                                    blurRadius: 30,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              width: 30.h,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 250.h,
                                width: 125.h,
                                child: ListWheelScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  onSelectedItemChanged: (value) {
                                    setState(() {
                                      _isSelected = value;
                                      _isPartSelected = 0;
                                      _isFile = 0;
                                    });
                                    BlocProvider.of<MusclesFilesCubit>(context).getMusclesFiles(
                                        muscleId: muscles[_isSelected].id!, partId: muscles[_isSelected].parts![_isPartSelected].id!,);
                                  },
                                  // diameterRatio: 1,
                                  itemExtent: 60,
                                  overAndUnderCenterOpacity: .3,
                                  children:
                                      List.generate(muscles.length, (index) {
                                    Muscle muscle = muscles[index];
                                    return Container(
                                      height: 70.h,
                                      width: 90.h,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10.h,
                                        vertical: 8.0.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.symmetric(
                                          horizontal: BorderSide(
                                            color: _isSelected == index
                                                ? MyColors.mainColor
                                                : Colors.transparent,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          translateString(muscle.titleEn!,
                                              muscle.titleAr!, muscle.titleKu!),
                                          style: TextStyle(
                                              color: _isSelected == index
                                                  ? MyColors.mainColor
                                                  : Colors.black,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w600,
                                              fontFamily:
                                                  (prefs.getString("lang") ==
                                                          "en")
                                                      ? 'Metropolis'
                                                      : 'Noto Naskh Arabic'),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      BlocBuilder<MusclesFilesCubit, MusclesFilesState>(
                          builder: (context, state) {
                        if (state is MusclesFilesSuccess) {
                          var files = state.files;
                          return files.isNotEmpty ?
                            Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      translateString(
                                          muscles[_isSelected].titleEn!,
                                          muscles[_isSelected].titleAr!,
                                          muscles[_isSelected].titleKu!),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              (prefs.getString("lang") == "en")
                                                  ? 'Metropolis'
                                                  : 'Noto Naskh Arabic'),
                                    ),
                                    SizedBox(
                                      height:80.h,
                                      width:100.w,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                          itemCount: files.length,
                                          itemBuilder: (context, index) {
                                            var file = files[index];
                                            return GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  _isFile = index;
                                                });
                                              },
                                              child: text_endpage(
                                                color: _isFile == index
                                                    ? MyColors.mainColor
                                                    : MyColors.colorBlack2,
                                                text: file.title!,
                                              ),
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 15.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  VideosTraining(musclePartFile: files[_isFile],),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: MyColors.mainColor,
                                          ),
                                          height: 48.h,
                                          width: 58.w,
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0.h),
                                            child: SvgPicture.asset(
                                                'assets/images/Vector.svg',
                                                fit: BoxFit.contain,
                                                height: 20.h,
                                                width: 20.w),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ) : const SizedBox();
                        } else if (state is MusclesFilesFailure) {
                          return CustomErrorScreen(
                            errorMessage: state.errorMessage,
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                    ],
                  ),
                )
              ],
            );
          } else if (state is MusclesFailure) {
            return CustomErrorScreen(
              errorMessage: state.errorMessage,
            );
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
