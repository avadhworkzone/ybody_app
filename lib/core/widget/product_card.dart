// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:knife/business%20logic/app_cubit/app_cubit.dart';
// import 'package:knife/core/constant/constants.dart';
// import 'package:knife/core/helper/router.dart';
// import 'package:knife/presentation/screen/ads_detail/ads_detail.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../constant/colors.dart';
// import 'space.dart';

// class ProductCardItem extends StatelessWidget {
//   final bool fromFav;
//   final int index;
//   final bool isSpecial;
//   final bool? fromCategory;
//   final bool isoffer;
//   const ProductCardItem(
//       {Key? key,
//       required this.fromFav,
//       required this.index,
//       required this.isoffer,
//       required this.isSpecial,
//       this.fromCategory})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     double h = MediaQuery.of(context).size.height;
//     return InkWell(
//       onTap: () => MagicRouter.navigateTo(const AdsDetailScreen()),
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(screenWidth(context) * 0.03),
//           color: Colors.white,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: double.infinity,
//               height: h * 0.17,
//               child: Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(screenWidth(context) * 0.03),
//                       topRight: Radius.circular(screenWidth(context) * 0.03),
//                     ),
//                     child: Image.asset(
//                       "assets/images/03.jpg",
//                       height: screenHeight(context) * 0.17,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Align(
//                     alignment: AlignmentDirectional.topEnd,
//                     child: Padding(
//                         padding: EdgeInsetsDirectional.only(
//                             top: screenHeight(context) * 0.01,
//                             end: screenWidth(context) * 0.02),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             BlocConsumer<AppCubit, AppState>(
//                               builder: (context, state) {
//                                 return InkWell(
//                                   onTap: () {
//                                     AppCubit.get(context)
//                                         .getFavourite(index: index);
//                                   },
//                                   child: (AppCubit.get(context)
//                                           .favouriteProducts
//                                           .contains(index))
//                                       ? Icon(
//                                           Icons.favorite,
//                                           color: MyColors.colorRed,
//                                           size: screenWidth(context) * 0.07,
//                                         )
//                                       : Icon(
//                                           Icons.favorite_outline,
//                                           color: MyColors.colorBlack,
//                                           size: screenWidth(context) * 0.07,
//                                         ),
//                                 );
//                               },
//                               listener: (context, state) {},
//                             ),
//                             (isoffer)
//                                 ? Text(
//                                     translateString("price 200 $currency",
//                                         "السعر 200 $currency"),
//                                     style: headingStyle.copyWith(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w400,
//                                       decorationThickness: 2,
//                                       decoration: TextDecoration.lineThrough,
//                                       decorationColor: Colors.black,
//                                       fontSize:
//                                           (prefs.getString("lang") == "en")
//                                               ? screenWidth(context) * 0.045
//                                               : screenWidth(context) * 0.05,
//                                     ),
//                                   )
//                                 : const SizedBox(),
//                           ],
//                         )),
//                   ),
//                   (isSpecial == true)
//                       ? Align(
//                           alignment: AlignmentDirectional.topStart,
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.only(
//                               end: w * 0.04,
//                             ),
//                             child: SizedBox(
//                               width: w * 0.1,
//                               child: Stack(
//                                 children: [
//                                   Image.asset(
//                                     "assets/icons/Path -8.png",
//                                     width: w * 0.1,
//                                     fit: BoxFit.fitWidth,
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: w * 0.01,
//                                         vertical: h * 0.01),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Center(
//                                           child: Image.asset(
//                                             "assets/icons/Path 19753@2x.png",
//                                             width: w * 0.07,
//                                             height: h * 0.02,
//                                             fit: BoxFit.contain,
//                                           ),
//                                         ),
//                                         const VerticalSpace(value: 0.3),
//                                         Center(
//                                           child: Text(
//                                             "مميز",
//                                             style: headingStyle.copyWith(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: w * 0.03),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       : (fromCategory == true)
//                           ? Align(
//                               alignment: AlignmentDirectional.topStart,
//                               child: Padding(
//                                 padding: EdgeInsetsDirectional.only(
//                                   end: w * 0.04,
//                                 ),
//                                 child: SizedBox(
//                                   width: w * 0.1,
//                                   child: Stack(
//                                     children: [
//                                       Image.asset(
//                                         "assets/icons/Path -8.png",
//                                         width: w * 0.1,
//                                         fit: BoxFit.fitWidth,
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: w * 0.01,
//                                             vertical: h * 0.01),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Center(
//                                               child: Image.asset(
//                                                 "assets/icons/Path 19753@2x.png",
//                                                 width: w * 0.07,
//                                                 height: h * 0.02,
//                                                 fit: BoxFit.contain,
//                                               ),
//                                             ),
//                                             const VerticalSpace(value: 0.3),
//                                             Center(
//                                               child: Text(
//                                                 "مميز",
//                                                 style: headingStyle.copyWith(
//                                                     color: Colors.white,
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: w * 0.03),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             )
//                           : const SizedBox(),
//                 ],
//               ),
//             ),
//             const VerticalSpace(value: 1),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text(
//                   "متجر الصياد",
//                   style: headingStyle.copyWith(
//                     fontSize: screenWidth(context) * 0.03,
//                     fontWeight: FontWeight.w600,
//                     color: MyColors.mainColor,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.visibility,
//                       color: MyColors.mainColor,
//                       size: screenWidth(context) * 0.05,
//                     ),
//                     Text(
//                       "70",
//                       style: headingStyle.copyWith(
//                         fontSize: screenWidth(context) * 0.03,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const HorizontalSpace(value: 1),
//               ],
//             ),
//             const VerticalSpace(value: 1),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: screenWidth(context) * 0.02,
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: screenWidth(context) * 0.25,
//                         child: Text(
//                           "للبيع معدات صيد مميزة",
//                           maxLines: 2,
//                           textAlign: TextAlign.start,
//                           overflow: TextOverflow.fade,
//                           style: headingStyle.copyWith(
//                             fontSize: screenWidth(context) * 0.04,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         "للبيع معدات صيد مميزه",
//                         maxLines: 1,
//                         overflow: TextOverflow.fade,
//                         style: headingStyle.copyWith(
//                           fontSize: screenWidth(context) * 0.025,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: " 35 ",
//                           style: headingStyle.copyWith(
//                             fontSize: screenWidth(context) * 0.04,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         TextSpan(
//                           text: currency,
//                           style: headingStyle.copyWith(
//                             fontSize: screenWidth(context) * 0.04,
//                             fontWeight: FontWeight.bold,
//                             color: MyColors.mainColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: screenWidth(context) * 0.02,
//               ),
//               child: Divider(
//                 color: MyColors.mainColor,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: screenWidth(context) * 0.05,
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     onTap: () async {
//                       await launch("tel://+96597244282");
//                     },
//                     child: Image.asset(
//                       "assets/icons/phone-alt.png",
//                       width: screenWidth(context) * 0.08,
//                       fit: BoxFit.fitWidth,
//                     ),
//                   ),
//                   SizedBox(
//                     height: screenHeight(context) * 0.04,
//                     child: VerticalDivider(
//                       color: MyColors.mainColor,
//                     ),
//                   ),
//                   InkWell(
//                       onTap: () async {
//                         await launch(
//                             "https://api.whatsapp.com/send?phone=+96597244282?text="
//                             "");
//                       },
//                       child: Icon(
//                         Icons.whatsapp,
//                         color: MyColors.colorGreen,
//                         size: screenWidth(context) * 0.08,
//                       )),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
