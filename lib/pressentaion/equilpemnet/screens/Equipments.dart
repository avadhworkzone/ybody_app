import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/widget/custom_app_bar.dart';
import 'package:x_fitness/core/widget/custom_error_screen.dart';
import 'package:x_fitness/core/widget/custom_loading_indicator.dart';
import 'package:x_fitness/models/Product.dart';
import 'package:x_fitness/models/SubCategory.dart';
import 'package:x_fitness/pressentaion/equilpemnet/manager/all_equipments_cubit/all_equipments_cubit.dart';
import 'package:x_fitness/pressentaion/equilpemnet/manager/detailed_equipment_cubit/detailed_equipment_cubit.dart';
import 'package:x_fitness/pressentaion/equilpemnet/manager/equipments_categories_cubit/equipments_categories_cubit.dart';
import 'package:x_fitness/pressentaion/equilpemnet/manager/filtered_equipments_cubit/filtered_equipments_cubit.dart';
import 'package:x_fitness/pressentaion/equilpemnet/screens/EquipmentsDeatilScreen.dart';
import 'package:x_fitness/pressentaion/equilpemnet/screens/filtered_equipment.dart';

class EquipmentsScreen extends StatefulWidget {
  const EquipmentsScreen({
    super.key,
  });

  @override
  State<EquipmentsScreen> createState() => _EquipmentsScreenState();
}

class _EquipmentsScreenState extends State<EquipmentsScreen> {
  var _isFav;
  var isFav;
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            CustomAppBar(
              text: translateString('Equipments', 'المعدات', 'ئامێرەکان'),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.h,
                top: 30.h,
                bottom: 20.h,
              ),
              child: Text(
                translateString('Categories', 'الأقسام', 'بەشەکان'),
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: (prefs.getString("lang") == "en")
                        ? 'Metropolis'
                        : 'Noto Naskh Arabic'),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(100),
              width: MediaQuery.of(context).size.width,
              child: BlocBuilder<EquipmentsCategoriesCubit,
                  EquipmentsCategoriesState>(
                builder: (context, state) {
                  if (state is EquipmentsCategoriesSuccess) {
                    List<SubCategory> categories = state.categories;
                    return Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          SubCategory subCategory = categories[index];
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<FilteredEquipmentsCubit>(context).getSubCategoryData(id: subCategory.id!);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => const FilteredEquipment()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(20)),
                              child: Column(
                                children: [
                                  Container(
                                    height: ScreenUtil().setHeight(59),
                                    width: ScreenUtil().setWidth(63),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              129, 129, 129, 0.1),
                                          spreadRadius: 0,
                                          blurRadius: 7,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10.h),
                                      // image: DecorationImage(
                                      //   image: AssetImage(
                                      //     'assets/images/Salad.png',
                                      //   ),
                                      // ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(13),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://dev.sanamedia.net/${subCategory.coverImage!}',
                                        height: 40.h,
                                        width: 40.w,
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
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setHeight(10),
                                  ),
                                  Text(
                                    subCategory.nameEn!,
                                    style: TextStyle(
                                      color: MyColors.colorBlack,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          (prefs.getString("lang") == "en")
                                              ? 'Metropolis'
                                              : 'Noto Naskh Arabic',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is EquipmentsCategoriesFailure) {
                    return CustomErrorScreen(errorMessage: state.errorMessage);
                  } else {
                    return const CustomLoadingIndicator();
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.h,
                top: 15.h,
                bottom: 20.h,
              ),
              child: Text(
                translateString('Products', 'المنتجات', 'محصولات'),
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: (prefs.getString("lang") == "en")
                        ? 'Metropolis'
                        : 'Noto Naskh Arabic'),
              ),
            ),
            BlocBuilder<AllEquipmentsCubit, AllEquipmentsState>(
              builder: (context, state) {
                if (state is EquipmentsSuccess) {
                  List<Product> equipments = state.equipments;
                  return GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: equipments.length,
                    padding: EdgeInsets.only(
                      right: ScreenUtil().setWidth(30),
                      left: ScreenUtil().setWidth(30),
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          screenWidth(context) / (screenHeight(context) / 1.41),
                      mainAxisSpacing: screenWidth(context) * 0.001,
                      crossAxisSpacing: screenHeight(context) * 0.023,
                    ),
                    itemBuilder: (context, index) {
                      Product equipment = equipments[index];
                      return GestureDetector(
                        child: Stack(
                          children: [
                            Container(
                              height: .55 * he,
                              width: ScreenUtil().setWidth(145.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(129, 129, 129, 0.1),
                                    spreadRadius: 0,
                                    blurRadius: 20,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<DetailedEquipmentCubit>(context).getDetailedEquipment(id: equipment.id!);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EquipmentsDeatilScreen()));
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                child: CachedNetworkImage(
                                  height: .39 * he,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                  imageUrl:
                                      'https://dev.sanamedia.net/${equipment.coverImage!}',
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
                            ),
                            Positioned(
                                bottom: 15.h,
                                right: 0,
                                left: 0,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.h, vertical: 20.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        equipment.nameEn!,
                                        style: TextStyle(
                                            color: MyColors.colorBlack2,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                                (prefs.getString("lang") ==
                                                        "en")
                                                    ? 'Metropolis'
                                                    : 'Noto Naskh Arabic'),
                                      ),
                                    ],
                                  ),
                                )),
                            Positioned(
                                bottom: 3.h,
                                right: 0,
                                left: 0,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.h, vertical: 12.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        '\$${equipment.price! - equipment.discount!}',
                                        style: TextStyle(
                                            color: MyColors.mainColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                                (prefs.getString("lang") ==
                                                        "en")
                                                    ? 'Metropolis'
                                                    : 'Noto Naskh Arabic'),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        '\$${equipment.price!}',
                                        style: TextStyle(
                                            color: MyColors.colorgrey2,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                (prefs.getString("lang") ==
                                                        "en")
                                                    ? 'Metropolis'
                                                    : 'Noto Naskh Arabic'),
                                      )
                                    ],
                                  ),
                                )),
                            Positioned(
                                top: .04 * he,
                                right: .04 * we,
                                bottom: .4 * he,
                                left: .23 * we,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFav = index;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isFav == index
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12.h),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              129, 129, 129, 0.1),
                                          spreadRadius: 0,
                                          blurRadius: 20,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.basketShopping,
                                      color: isFav == index
                                          ? Colors.white
                                          : Colors.black,
                                      size: 22.sp,
                                    )),
                                  ),
                                )),
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is EquipmentsFailure) {
                  return CustomErrorScreen(errorMessage: state.errorMessage);
                } else {
                  return const CustomLoadingIndicator();
                }
              },
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }
}