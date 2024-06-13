// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/widget/custom_error_screen.dart';
import 'package:x_fitness/core/widget/custom_loading_indicator.dart';
import 'package:x_fitness/models/Coach.dart';
import 'package:x_fitness/pressentaion/Coaches/CoachDescrption.dart';
import 'package:x_fitness/pressentaion/Coaches/manager/all_coaches_cubit/all_coaches_cubit.dart';
import '../../core/widget/custom_app_bar.dart';

class CoachesScreen extends StatelessWidget {
  const CoachesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            CustomAppBar(
                text: translateString('Coaches', 'المدربين', 'ڕاهێنەران')),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.052,
            ),
            BlocBuilder<AllCoachesCubit, AllCoachesState>(
              builder: (context, state) {
                if (state is AllCoachesSuccess) {
                  List<Coach> coaches = state.coaches;
                  return GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: coaches.length,
                      padding: EdgeInsets.only(
                        right: ScreenUtil().setWidth(30),
                        left: ScreenUtil().setWidth(30),
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: screenWidth(context) /
                            (screenHeight(context) / 1.45),
                        mainAxisSpacing: screenWidth(context) * 0.01,
                        crossAxisSpacing: screenHeight(context) * 0.023,
                      ),
                      itemBuilder: (context, index) {
                        Coach coach = coaches[index] ;
                        return GestureDetector(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CoachDescrption(coach: coach,)));
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: .255 * h,
                                      width: ScreenUtil().setWidth(145.w),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromRGBO(
                                                129, 129, 129, 0.1),
                                            spreadRadius: 0,
                                            blurRadius: 20,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10.h),
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
                                          imageUrl:
                                          'https://dev.sanamedia.net/${coach.profileImage}',
                                          height: .4 * w,
                                          fit: BoxFit.fill,
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
                                    ),
                                    Positioned(
                                        bottom: 7.h,
                                        right: 0,
                                        left: 0,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.h, vertical: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                coach.name!,
                                                style: TextStyle(
                                                    color: MyColors.colorBlack2,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily:
                                                        (prefs.getString(
                                                                    "lang") ==
                                                                "en")
                                                            ? 'Metropolis'
                                                            : 'Noto Naskh Arabic'),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                } else if (state is AllCoachesFailure) {
                  return CustomErrorScreen(
                    errorMessage: state.errorMessage,
                  );
                } else {
                  return const CustomLoadingIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
