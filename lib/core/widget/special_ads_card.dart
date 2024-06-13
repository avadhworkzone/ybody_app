// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:knife/core/widget/space.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../../../core/constant/colors.dart';
// import 'package:knife/core/constant/constants.dart';

// class SpecialAdsCard extends StatefulWidget {
//   final int index;
//   const SpecialAdsCard({Key? key, required this.index}) : super(key: key);

//   @override
//   State<SpecialAdsCard> createState() => _SpecialAdsCardState();
// }

// class _SpecialAdsCardState extends State<SpecialAdsCard> {
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     double h = MediaQuery.of(context).size.height;
//     return Stack(
//       alignment: AlignmentDirectional.bottomEnd,
//       children: [
//         Container(
//           width: w * 0.9,
//           margin: EdgeInsets.symmetric(
//             horizontal: w * 0.02,
//           ),
//           padding:
//               EdgeInsets.symmetric(horizontal: w * 0.017, vertical: h * 0.007),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(w * 0.03),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 height: h * 0.23,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.all(Radius.circular(w * 0.03)),
//                   child: Image.asset(
//                     "assets/images/ssss-3.jpg",
//                     fit: BoxFit.fitWidth,
//                   ),
//                 ),
//               ),
//               const VerticalSpace(value: 1),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: " صيد ",
//                           style: headingStyle.copyWith(
//                             fontSize: w * 0.03,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.grey,
//                           ),
//                         ),
//                         TextSpan(
//                           text: "معدات صيد",
//                           style: headingStyle.copyWith(
//                             fontSize: w * 0.03,
//                             fontWeight: FontWeight.w400,
//                             color: MyColors.mainColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const VerticalSpace(value: 0.7),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             width: w * 0.4,
//                             child: Text(
//                               "للبيع معدات صيد مميزة",
//                               maxLines: 2,
//                               textAlign: TextAlign.start,
//                               overflow: TextOverflow.ellipsis,
//                               style: headingStyle.copyWith(
//                                 fontSize: (prefs.getString("lang") == "en")
//                                     ? screenWidth(context) * 0.03
//                                     : screenWidth(context) * 0.04,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                           const VerticalSpace(value: 0.7),
//                           SizedBox(
//                             width: w * 0.4,
//                             child: Text(
//                               'افضل الأسعار والمواصفات',
//                               maxLines: 2,
//                               textAlign: TextAlign.start,
//                               overflow: TextOverflow.ellipsis,
//                               style: headingStyle.copyWith(
//                                 fontSize: w * 0.035,
//                                 fontWeight: FontWeight.bold,
//                                 color: MyColors.mainColor,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const HorizontalSpace(value: 1.5),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/icons/location-sharp@3x.png",
//                                 width: w * 0.05,
//                                 height: h * 0.03,
//                                 fit: BoxFit.contain,
//                               ),
//                               const HorizontalSpace(value: 0.5),
//                               SizedBox(
//                                 // width: w * 0.4,
//                                 child: Text(
//                                   "محافظة حولي",
//                                   maxLines: 2,
//                                   textAlign: TextAlign.center,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: headingStyle.copyWith(
//                                     fontSize: w * 0.03,
//                                     fontWeight: FontWeight.w500,
//                                     color: MyColors.colorDeepBlue,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const VerticalSpace(value: 0.7),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "assets/icons/clock-outline-badged.png",
//                                 width: w * 0.05,
//                                 height: h * 0.03,
//                                 fit: BoxFit.contain,
//                               ),
//                               const HorizontalSpace(value: 0.5),
//                               Text(
//                                 "منذ10 دقائق",
//                                 maxLines: 2,
//                                 textAlign: TextAlign.center,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: headingStyle.copyWith(
//                                   fontSize: w * 0.03,
//                                   fontWeight: FontWeight.w500,
//                                   color: MyColors.colorDeepBlue,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Divider(
//                     color: MyColors.mainColor,
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.only(end: w * 0.15),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             await launch("tel://+96597244282");
//                           },
//                           child: Image.asset(
//                             "assets/icons/phone-alt.png",
//                             width: w * 0.09,
//                             fit: BoxFit.fitWidth,
//                           ),
//                         ),
//                         SizedBox(
//                           height: h * 0.06,
//                           child: VerticalDivider(color: MyColors.mainColor),
//                         ),
//                         InkWell(
//                             onTap: () async {
//                               await launch(
//                                   "https://api.whatsapp.com/send?phone=+96597244282?text="
//                                   "");
//                             },
//                             child: Image.asset(
//                               "assets/icons/whatsappalt-1.png",
//                               width: w * 0.09,
//                               fit: BoxFit.fitWidth,
//                               color: MyColors.colorGreen,
//                             )),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         PositionedDirectional(
//           bottom: h * 0.08,
//           top: h * 0.21,
//           child: Container(
//             width: w * 0.15,
//             height: h * 0.2,
//             margin: EdgeInsetsDirectional.only(
//               end: w * 0.06,
//             ),
//             decoration: BoxDecoration(
//               color: MyColors.mainColor,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(w * 0.02),
//                 topRight: Radius.circular(w * 0.02),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const VerticalSpace(value: 1.5),
//                 Text(
//                   translateString("price", "السعر"),
//                   style: headingStyle.copyWith(
//                       fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//                 const VerticalSpace(value: 1),
//                 Text(
//                   "400",
//                   style: headingStyle.copyWith(
//                       fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//                 const VerticalSpace(value: 1),
//                 Text(
//                   currency,
//                   style: headingStyle.copyWith(
//                       fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         (widget.index == 0 || widget.index == 1)
//             ? Align(
//                 alignment: AlignmentDirectional.topEnd,
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.only(end: w * 0.8),
//                   child: SizedBox(
//                     width: w * 0.1,
//                     child: Stack(
//                       children: [
//                         Image.asset(
//                           "assets/icons/Path -8.png",
//                           width: w * 0.1,
//                           fit: BoxFit.fitWidth,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: w * 0.01, vertical: h * 0.01),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Center(
//                                 child: Image.asset(
//                                   "assets/icons/Path 19753@2x.png",
//                                   width: w * 0.07,
//                                   height: h * 0.02,
//                                   fit: BoxFit.contain,
//                                 ),
//                               ),
//                               const VerticalSpace(value: 0.3),
//                               Center(
//                                 child: Text(
//                                   "مميز",
//                                   style: headingStyle.copyWith(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: w * 0.03),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             : const SizedBox(),
//       ],
//     );
//   }
// }
