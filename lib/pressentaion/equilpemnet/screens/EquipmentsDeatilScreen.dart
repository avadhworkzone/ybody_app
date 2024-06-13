import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/widget/custom_app_bar.dart';
import 'package:x_fitness/core/widget/custom_error_screen.dart';
import 'package:x_fitness/core/widget/custom_loading_indicator.dart';
import 'package:x_fitness/models/DetailedProduct.dart';
import 'package:x_fitness/pressentaion/DietFood/widgets/add_buttomcart.dart';
import 'package:x_fitness/pressentaion/DietFood/widgets/buttom_size.dart';
import 'package:x_fitness/pressentaion/GymDiscounts/widgets/sliderBig.dart';
import 'package:x_fitness/pressentaion/equilpemnet/manager/detailed_equipment_cubit/detailed_equipment_cubit.dart';
import 'package:x_fitness/pressentaion/equilpemnet/screens/coupons_screen.dart';
import 'package:x_fitness/pressentaion/equilpemnet/widgets/cutomColorselect.dart';
import '../../GymDiscounts/widgets/openimagePriview.dart';

class EquipmentsDeatilScreen extends StatefulWidget {
  const EquipmentsDeatilScreen({
    super.key,
  });

  @override
  State<EquipmentsDeatilScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EquipmentsDeatilScreen> {
  int _selectedSize = 0;
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    var wSize = MediaQuery.of(context).size.width;
    return BlocBuilder<DetailedEquipmentCubit, DetailedEquipmentState>(
      builder: (context, state) {
        if (state is DetailedEquipmentSuccess) {
          DetailedProduct detailedEquipment = state.detailedEquipment;
          List<String> imageUrls = [];
          List<String> sizes = [];
          List<String> colors = [];
          for (int i = 0; i < detailedEquipment.images!.length; i++) {
            imageUrls.add(detailedEquipment.images![i].image!);
          }
          for (int i = 0; i < detailedEquipment.sizes!.length; i++) {
            sizes.add(detailedEquipment.sizes![i].value!);
          }
          for (int i = 0; i < detailedEquipment.colors!.length; i++) {
            colors.add(detailedEquipment.colors![i].value!);
          }
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImageSliderB(
                                      imageUrls: imageUrls,
                                    )));
                      },
                      child: ImageSliderBB(
                        imageUrls: imageUrls,
                      ),
                    ),
                    Positioned(
                      // ignore: sort_child_properties_last
                      child: const CustomAppBar(text: ''),
                      top: 0.h,
                      left: 0,
                      right: 0,
                      bottom: 200.h,
                    )
                  ],
                ),
                SizedBox(
                  height: 14.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                    width: ScreenUtil().setHeight(300.w),
                    height: (prefs.getString("lang") == "en")
                        ? ScreenUtil().setHeight(380.h)
                        : ScreenUtil().setHeight(450.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(129, 129, 129, 0.1),
                          spreadRadius: 5,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, left: 20.w, right: 20.w, bottom: 15.h),
                          child: Text(
                            detailedEquipment.nameEn!,
                            style: TextStyle(
                              color: MyColors.colorBlack,
                              fontSize: 24.sp,
                              fontFamily: (prefs.getString("lang") == "en")
                                  ? 'Metropolis'
                                  : 'Noto Naskh Arabic',
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Price',
                                    style: TextStyle(
                                      color: MyColors.colorBlack,
                                      fontSize: 16.sp,
                                      fontFamily:
                                          (prefs.getString("lang") == "en")
                                              ? 'Metropolis'
                                              : 'Noto Naskh Arabic',
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${detailedEquipment.price! - detailedEquipment.discount!}',
                                        style: TextStyle(
                                          color: MyColors.mainColor,
                                          fontSize: 24.sp,
                                          fontFamily:
                                              (prefs.getString("lang") == "en")
                                                  ? 'Metropolis'
                                                  : 'Noto Naskh Arabic',
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.h,
                                      ),
                                      Text(
                                        '\$${detailedEquipment.price!}',
                                        style: TextStyle(
                                          color: MyColors.colorBlack
                                              .withOpacity(.3),
                                          fontSize: 12.sp,
                                          fontFamily:
                                              (prefs.getString("lang") == "en")
                                                  ? 'Metropolis'
                                                  : 'Noto Naskh Arabic',
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Discount',
                                    style: TextStyle(
                                      color: MyColors.colorBlack,
                                      fontSize: 16.sp,
                                      fontFamily:
                                          (prefs.getString("lang") == "en")
                                              ? 'Metropolis'
                                              : 'Noto Naskh Arabic',
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${((detailedEquipment.discount! / detailedEquipment.price!) * 100).floor()}%',
                                        style: TextStyle(
                                          color: MyColors.mainColor,
                                          fontSize: 24.sp,
                                          fontFamily:
                                              (prefs.getString("lang") == "en")
                                                  ? 'Metropolis'
                                                  : 'Noto Naskh Arabic',
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.h,
                                      ),
                                      Text(
                                        'Off',
                                        style: TextStyle(
                                          color: MyColors.colorBlack
                                              .withOpacity(.3),
                                          fontSize: 12.sp,
                                          fontFamily:
                                              (prefs.getString("lang") == "en")
                                                  ? 'Metropolis'
                                                  : 'Noto Naskh Arabic',
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 15.h, left: 20.w, right: 20.w, bottom: 5.h),
                          child: Text(
                              translateString('Description', 'الوصف', 'شرح'),
                              style: TextStyle(
                                color: MyColors.colorBlack,
                                fontSize: 16.sp,
                                fontFamily: (prefs.getString("lang") == "en")
                                    ? 'Metropolis'
                                    : 'Noto Naskh Arabic',
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 25.w, bottom: 5.h),
                          child: Text(detailedEquipment.descriptionEn!,
                              style: TextStyle(
                                color: MyColors.colorBlack,
                                fontSize: 12.sp,
                                fontFamily: (prefs.getString("lang") == "en")
                                    ? 'Metropolis'
                                    : 'Noto Naskh Arabic',
                                fontWeight: FontWeight.w400,
                                // overflow: TextOverflow.ellipsis,
                              )),
                        ),
                        sizes.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.only(
                                    top: 15.h,
                                    left: 20.w,
                                    right: 20.w,
                                    bottom: 5.h),
                                child: Text(
                                    translateString(
                                        'Select Wheel Size',
                                        'اختر نوع الاطار',
                                        'اندازه چرخ را انتخاب کنید'),
                                    style: TextStyle(
                                      color: MyColors.colorBlack,
                                      fontSize: 16.sp,
                                      fontFamily:
                                          (prefs.getString("lang") == "en")
                                              ? 'Metropolis'
                                              : 'Noto Naskh Arabic',
                                      fontWeight: FontWeight.w700,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              )
                            : const SizedBox(),
                        sizes.isNotEmpty ? SizedBox(
                          height: 40.h,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(
                                  top: 0.h,
                                  left: 10.w,
                                  right: 10.w,
                                  bottom: 0.h),
                              itemCount: sizes.length,
                              itemBuilder: (context, index) {
                                var size = sizes[index];
                                return cutomButtomSize(
                                  onTap: () {
                                    setState(() {
                                      _selectedSize = index;
                                    });
                                  },
                                  colorContiner: _selectedSize == index
                                      ? MyColors.mainColor
                                      : MyColors.colorWhite,
                                  colortext: _selectedSize == index
                                      ? MyColors.colorWhite
                                      : MyColors.colorBlack2.withOpacity(.4),
                                  text: size,
                                  Bordercolor: _selectedSize == index
                                      ? Colors.transparent
                                      : MyColors.colorgrey2,
                                );
                              }),
                        ): const SizedBox(),
                        colors.isNotEmpty ? Padding(
                          padding: EdgeInsets.only(
                            top: 20.h,
                            left: 20.w,
                            right: 20.w,
                          ),
                          child: Text(
                              translateString('Select  Color', 'اختر النوع',
                                  'رنگ را انتخاب کنید'),
                              style: TextStyle(
                                color: MyColors.colorBlack,
                                fontSize: 16.sp,
                                fontFamily: (prefs.getString("lang") == "en")
                                    ? 'Metropolis'
                                    : 'Noto Naskh Arabic',
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ) : const SizedBox(),
                        colors.isNotEmpty ? SizedBox(
                          height: 50.h,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(
                                  top: 0.h,
                                  left: 15.w,
                                  right: 15.w,
                                  bottom: 0.h),
                              itemCount: colors.length,
                              itemBuilder: (context, index) {
                                var color = colors[index];
                                color = "0xff${color.substring(1)}";
                                int Fcolor = int.parse(color);
                                return cutomButtomSizeSelect(
                                  onTap: () {
                                    setState(() {
                                      _selectedColor = index;
                                    });
                                  },
                                  colorContiner: Color(Fcolor),
                                  isSelcted: _selectedColor == index,
                                );
                              }),
                        ): const SizedBox(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                    width: ScreenUtil().setHeight(310.w),
                    height: (prefs.getString("lang") == "en")
                        ? ScreenUtil().setHeight(53.h)
                        : ScreenUtil().setHeight(60.h),
                    decoration: BoxDecoration(
                      color: MyColors.colorBlack,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(129, 129, 129, 0.1),
                          spreadRadius: 5,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, top: 15.h, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            translateString('Note', 'ملاحظة', 'تێبینی'),
                            style: TextStyle(
                              color: MyColors.colorWhite,
                              fontSize: 16.sp,
                              fontFamily: (prefs.getString("lang") == "en")
                                  ? 'Metropolis'
                                  : 'Noto Naskh Arabic',
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            translateString(
                                'Delivery only for Erbil',
                                'التوصيل فقط لاربيل',
                                'تەنها بۆ هەولێر گەیاندن بەردەستە'),
                            style: TextStyle(
                              color: MyColors.colorWhite,
                              fontSize: 12.sp,
                              fontFamily: (prefs.getString("lang") == "en")
                                  ? 'Metropolis'
                                  : 'Noto Naskh Arabic',
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ]),
            ),
            bottomNavigationBar: Container(
              height: (prefs.getString("lang") == "en")
                  ? .41 * wSize
                  : .475 * wSize,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: MyColors.colorWhite,
                boxShadow: [
                  BoxShadow(
                    color: MyColors.colorgrey2,
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 7.h, bottom: 5.h, left: 20.w, right: 20.w),
                        child: Column(
                          children: [
                            Text(
                              translateString(
                                  'Total Price', 'السعر الكلي', 'کۆی گشتی'),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic',
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '\$${detailedEquipment.price! - detailedEquipment.discount!}',
                              style: TextStyle(
                                  color: MyColors.mainColor,
                                  fontSize: 24.sp,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic',
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      addAndDeletButtomTocart()
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 6.h, bottom: 20.h, left: 10.w, right: 20.w),
                    child: Row(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog2verifed();
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                child: Container(
                                    height: ScreenUtil().setHeight(48),
                                    width: ScreenUtil().setWidth(140),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              117, 117, 117, 1)),
                                      color: MyColors.colorWhite,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        translateString('Add to cart',
                                            'اضف للعربة', 'خستنە باسکە'),
                                        style: TextStyle(
                                            color: MyColors.colorBlack,
                                            fontSize: 16.sp,
                                            fontFamily:
                                                (prefs.getString("lang") ==
                                                        "en")
                                                    ? 'Metropolis'
                                                    : 'Noto Naskh Arabic',
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ) //Text('Total: \$ 0.00'),
                                    ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CouponsScreen()),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: Container(
                                height: ScreenUtil().setHeight(48),
                                width: ScreenUtil().setWidth(140),
                                decoration: BoxDecoration(
                                  color: MyColors.mainColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    translateString(
                                        'Order Now', 'اطلب الان', 'داواکردن'),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontFamily:
                                            (prefs.getString("lang") == "en")
                                                ? 'Metropolis'
                                                : 'Noto Naskh Arabic',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ) //Text('Total: \$ 0.00'),
                                ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (state is DetailedEquipmentFailure) {
          return CustomErrorScreen(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }

  Future<dynamic> showDialog2verifed() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 140.h,
            width: 304.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 15.0.h, left: 20.w, right: 20.w),
                  child: Text(
                    'Your Order has been added to cart',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: (prefs.getString("lang") == "en")
                            ? 'Metropolis'
                            : 'Noto Naskh Arabic',
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                SvgPicture.asset('assets/icons_fill/Mask group.svg'),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                  child: Text(
                    'Your Order has been added to cart',
                    style: TextStyle(
                        color: MyColors.colorBlack2.withOpacity(.8),
                        fontSize: 10.sp,
                        fontFamily: (prefs.getString("lang") == "en")
                            ? 'Metropolis'
                            : 'Noto Naskh Arabic',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                // Your order has been placed.
              ],
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        );
      },
    );
  }
}

class CheckTextBox extends StatelessWidget {
  const CheckTextBox({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: MyColors.colorBlack2.withOpacity(.4),
          fontSize: 12.sp,
          fontFamily:
              (prefs.getString("lang") == "en") ? 'Metropolis' : 'Noto Naskh Arabic',
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ));
  }
}
