import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:x_fitness/core/constant/colors.dart';

import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/models/Gym.dart';
import 'package:x_fitness/pressentaion/GymDiscounts/manager/all_gyms_cubit/all_gyms_cubit.dart';
import 'package:x_fitness/pressentaion/GymDiscounts/screens/gym_descrption.dart';
import 'package:x_fitness/pressentaion/GymDiscounts/widgets/customCardGym.dart';

import '../../../core/widget/custom_error_screen.dart';
import '../../../core/widget/custom_loading_indicator.dart';

class GymDiscountScreen extends StatefulWidget {
  const GymDiscountScreen({super.key});

  @override
  State<GymDiscountScreen> createState() => _GymDiscountScreenState();
}

class _GymDiscountScreenState extends State<GymDiscountScreen> {
  late String _selectedColor;
  bool _isVisible = false;
  bool _isVisible2 = false;
  ScrollController _scrollController = ScrollController();
  Widget _appBarTitle = Text(
    translateString('Gym Discounts', 'خصومات الجيم', 'داشکانی هۆڵەکان'),
    style: TextStyle(
        color: MyColors.colorBlack2,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        fontFamily: (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic'),
  );

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  final List<String> time = [
    '9:00 AM - 12:00 PM',
    '9:00 AM - 12:00 PM',
    '9:00 AM - 12:00 PM'
  ];
  void _toggleContainer() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _toggleContainer2() {
    setState(() {
      _isVisible2 = !_isVisible2;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var size2 = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitle,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(6.0.w),
          child: InkWell(
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
        ),
      ),
      backgroundColor: MyColors.backgroundColor,
      body: Builder(builder: (context) {
        _scrollController.addListener(() {
          if (_scrollController.offset > 0) {
            setState(() {
              _appBarTitle = Text(
                translateString(
                    'Gym Discounts', 'خصومات الجيم', 'داشکانی هۆڵەکان'),
                style: TextStyle(
                    color: MyColors.colorBlack2,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: (prefs.getString("lang") == "en")
                        ? 'Metropolis'
                        : 'Noto Naskh Arabic'),
              );
            });
            // setState(() {
            //   _appBarTitle = Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       dropdownButtom(
            //         text1: 'City',
            //         onpressed: () {
            //           setState(() {
            //             _isVisible2 = !_isVisible2;
            //           });
            //         },
            //         text2: '4',
            //         color: MyColors.mainColor,
            //         width1: 15,
            //       ),
            //       const dropdownButtom(
            //         text1: 'Services',
            //         text2: '',
            //         color: Colors.transparent,
            //         width1: 0,
            //       ),
            //       const dropdownButtom(
            //         text1: 'Time',
            //         text2: '',
            //         color: Colors.transparent,
            //         width1: 0,
            //       ),
            //     ],
            //   );
            // });
          } else {
            setState(() {
              _appBarTitle = Text(
                translateString(
                    'Gym Discounts', 'خصومات الجيم', 'داشکانی هۆڵەکان'),
                style: TextStyle(
                    color: MyColors.colorBlack2,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: (prefs.getString("lang") == "en")
                        ? 'Metropolis'
                        : 'Noto Naskh Arabic'),
              );
            });
          }
        });
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            /*
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      dropdownButtom(
                        text1: translateString('City', 'المدينة', 'شارەکان'),
                        onpressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        text2: '4',
                        color: MyColors.mainColor,
                        width1: 15,
                      ),
                      dropdownButtom(
                        text1: translateString(
                            'Services', 'الخدمة', 'خزمەتگوزارییەکان'),
                        text2: '',
                        color: Colors.transparent,
                        width1: 0,
                      ),
                      dropdownButtom(
                        text1: translateString('Time', 'الوقت', 'کات'),
                        text2: '',
                        color: Colors.transparent,
                        width1: 0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                */
            // Stack(children: [
            //   GestureDetector(
            //     onTap: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => GymDescription())),
            //     child: customCardGyn(
            //       images: index == 1 ? images : images2,
            //       GymName: GymNames[index],
            //       price: price[index],
            //       time: time[index],
            //     ),
            //   ),
            //   Visibility(
            //     visible: _isVisible,
            //     child: Positioned(
            //       child: Container(
            //         height:
            //             (prefs.getString("lang") == "en") ? 120.h : 140.h,
            //         width: 310.w,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(5.h),
            //           boxShadow: const [
            //             BoxShadow(
            //               color: Color.fromRGBO(129, 129, 129, 0.1),
            //               spreadRadius: 0,
            //               blurRadius: 20,
            //             ),
            //           ],
            //         ),
            //         child: Column(
            //           children: [
            //             SizedBox(
            //               height: 10.h,
            //             ),
            //             namecityFilter(
            //               image: SvgPicture.asset(
            //                   'assets/images/aertss.svg'),
            //               cityname: 'Erbil',
            //               cityname2: 'Duhok',
            //             ),
            //             const namecityFilter(
            //               cityname: 'Sulaymaniyah',
            //               cityname2: 'Baghdad',
            //             ),
            //             const namecityFilter(
            //               cityname: 'Duhok',
            //               cityname2: 'Basra',
            //             ),
            //             namecityFilter(
            //               cityname: 'Kirkuk',
            //               cityname2: 'Mosul',
            //               image: SvgPicture.asset(
            //                   'assets/images/aertss.svg'),
            //             ),
            //             // SizedBox(
            //             //   height: 10.h,
            //             // ),
            //             Padding(
            //               padding: EdgeInsets.symmetric(
            //                   horizontal: 20.w, vertical: 10.h),
            //               child: Row(
            //                 children: [
            //                   buttomFilert(
            //                       text: 'Apply',
            //                       color: MyColors.mainColor,
            //                       textcolor: Colors.white,
            //                       Bordercolor: Colors.transparent,
            //                       onTap: () {
            //                         setState(() {
            //                           _isVisible = !_isVisible;
            //                         });
            //                       }),
            //                   SizedBox(
            //                     width: 10.w,
            //                   ),
            //                   buttomFilert(
            //                     onTap: () {
            //                       setState(() {
            //                         _isVisible = !_isVisible;
            //                       });
            //                     },
            //                     text: 'Reset',
            //                     color: Colors.white,
            //                     textcolor: MyColors.colorBlack,
            //                     Bordercolor:
            //                         Color.fromRGBO(117, 117, 117, 1),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ]),
            Expanded(
              child: BlocBuilder<AllGymsCubit, AllGymsState>(
                builder: (context, state) {
                  if (state is AllGymsSuccess) {
                    List<Gym> gyms = state.gyms;
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                        physics: const BouncingScrollPhysics(),
                        itemCount: gyms.length,
                        itemBuilder: (context, index) {
                          var gym = gyms[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         GymDescription(gym: gym,))),
                            child: customCardGyn(
                              image: gym.coverImage!,
                              GymName: gym.nameEn!,
                              price: gym.price!.toString(),
                              time: '${gym.openAt} - ${gym.closeAt}'
                            ),
                          );
                        });
                  }else if (state is AllGymsFailure) {
                    return CustomErrorScreen(
                      errorMessage: state.errorMessage,
                    );
                  } else {
                    return const CustomLoadingIndicator();
                  }
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        );
        Stack(
          children: [
            //end of the screen below
            /*
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Visibility(
                visible: _isVisible2,
                child: Positioned(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Container(
                      height: (prefs.getString("lang") == "en") ? 120.h : 140.h,
                      width: 310.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.h),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(129, 129, 129, 0.1),
                            spreadRadius: 0,
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          namecityFilter(
                            image: SvgPicture.asset('assets/images/aertss.svg'),
                            cityname: 'Erbil',
                            cityname2: 'Duhok',
                          ),
                          const namecityFilter(
                            cityname: 'Sulaymaniyah',
                            cityname2: 'Baghdad',
                          ),
                          const namecityFilter(
                            cityname: 'Duhok',
                            cityname2: 'Basra',
                          ),
                          namecityFilter(
                            cityname: 'Kirkuk',
                            cityname2: 'Mosul',
                            image: SvgPicture.asset('assets/images/aertss.svg'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            child: Row(
                              children: [
                                buttomFilert(
                                    text: 'Apply',
                                    color: MyColors.mainColor,
                                    textcolor: Colors.white,
                                    Bordercolor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        _isVisible2 = !_isVisible2;
                                      });
                                    }),
                                SizedBox(
                                  width: 10.w,
                                ),
                                buttomFilert(
                                  onTap: () {
                                    setState(() {
                                      _isVisible2 = !_isVisible2;
                                    });
                                  },
                                  text: 'Reset',
                                  color: Colors.white,
                                  textcolor: MyColors.colorBlack,
                                  Bordercolor: Color.fromRGBO(117, 117, 117, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
             */
          ],
        );
      }),
    );
  }
}
