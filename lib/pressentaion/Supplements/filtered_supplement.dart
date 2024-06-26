import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/widget/custom_app_bar.dart';
import 'package:x_fitness/core/widget/custom_error_screen.dart';
import 'package:x_fitness/core/widget/custom_loading_indicator.dart';
import 'package:x_fitness/models/Product.dart';
import 'package:x_fitness/pressentaion/sportswear/manager/detailed_sports_wear_cubit/detailed_sports_wear_cubit.dart';
import 'package:x_fitness/pressentaion/sportswear/sports_wear_details.dart';
import '../../../core/constant/colors.dart';
import '../../models/Brand.dart';
import 'manager/filtered_supplements_cubit/filtered_supplements_cubit.dart';

class FilteredSupplements extends StatefulWidget {
  const FilteredSupplements({
    Key? key,
  }) : super(key: key);
  @override
  State<FilteredSupplements> createState() => _FilteredSupplementsState();
}

class _FilteredSupplementsState extends State<FilteredSupplements> {
  var _isFav;
  var isFav;
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<FilteredSupplementsCubit, FilteredSupplementsState>(
        builder: (context, state) {
          if (state is FilteredSupplementsSuccess) {
            Brand brand = state.brand;
            var products = brand.supplements!;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  CustomAppBar(
                    text: translateString(brand.nameEn!,
                        brand.nameAr!, brand.nameKu!),
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
                  GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: products.length,
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
                      Product wear = products[index];
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
                                BlocProvider.of<DetailedSportsWearCubit>(context)
                                    .getDetailedSportsWear(id: wear.id!);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SportsWearDeatils()));
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
                                  'https://dev.sanamedia.net/${wear.coverImage!}',
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
                                        wear.nameEn!,
                                        style: TextStyle(
                                            color: MyColors.colorBlack2,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                            (prefs.getString("lang") == "en")
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
                                        '\$${wear.price! - wear.discount!}',
                                        style: TextStyle(
                                            color: MyColors.mainColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                            (prefs.getString("lang") == "en")
                                                ? 'Metropolis'
                                                : 'Noto Naskh Arabic'),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        '\$${wear.price!}',
                                        style: TextStyle(
                                            color: MyColors.colorgrey2,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                            (prefs.getString("lang") == "en")
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
                                          color:
                                          Color.fromRGBO(129, 129, 129, 0.1),
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
                  ),
                  SizedBox(
                    height: 40.h,
                  )
                ],
              ),
            );
          }  else if (state is FilteredSupplementsFailure){
            return CustomErrorScreen(errorMessage: state.errorMessage,);
          }else{
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
