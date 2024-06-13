import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/widget/custom_app_bar.dart';
import 'package:x_fitness/pressentaion/Basket/widgets/add_buttom.dart';
import 'package:x_fitness/pressentaion/SupplementsCheckout/widgets/card_info.dart';

import 'widgets/buttomsendorder.dart';

class SupplementsCheckoutscreen extends StatefulWidget {
  const SupplementsCheckoutscreen({super.key});

  @override
  State<SupplementsCheckoutscreen> createState() =>
      _SupplementsCheckoutscreenState();
}

class _SupplementsCheckoutscreenState extends State<SupplementsCheckoutscreen> {
  Future<void> showLoadingDialog() async {
    await Future.delayed(
        Duration(milliseconds: 200)); // Delay for  200 milliseconds
    // ignore: use_build_context_synchronously
    showdialog1whatsApp();
    await Future.delayed(Duration(seconds: 2)); // Delay for 2 seconds
    Navigator.pop(context);
    // ignore: use_build_context_synchronously
    showDialog2verifed();

    await Future.delayed(Duration(seconds: 2)); // Delay for 2 seconds
    Navigator.pop(context);
  }

  Future<dynamic> showDialog2verifed() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 150.h,
            width: 304.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0.h, left: 5.w, right: 5.w),
                  child: Text(
                    'Verification Completed Successfully!',
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
                  padding: EdgeInsets.only(top: 10.0.h, left: 10, right: 10),
                  child: Text(
                    'Your order has been placed.',
                    style: TextStyle(
                        color: MyColors.colorBlack2.withOpacity(.8),
                        fontSize: 12.sp,
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

  Future<dynamic> showdialog1whatsApp() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 160.h,
            width: 304.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 5, right: 5),
                  child: Text(
                    'Your Order Is Processing Through Whatsapp',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
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
                SvgPicture.asset('assets/icons_fill/loading.svg'),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20.0.h, left: 20.w, right: 20.w),
                  child: Text(
                    'Please be patient while we are verifying.',
                    style: TextStyle(
                      color: MyColors.colorBlack2.withOpacity(.8),
                      fontSize: 10.sp,
                      fontFamily: (prefs.getString("lang") == "en")
                          ? 'Metropolis'
                          : 'Noto Naskh Arabic',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            CustomAppBar(
                text: translateString(
              'Check Out',
              'عربة التسوق   ',
              'ناردنی داواکارییەکە',
            )),
            SizedBox(
              height: 40.h,
            ),
            Container(
              height: he * 0.2,
              // 113.h,
              width: 310.w,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(129, 129, 129, 0.1),
                    spreadRadius: 0,
                    blurRadius: 20,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  cardinfo(
                      text2: 'Sulaymaniyah',
                      text3: 'Erbil',
                      text1: translateString('Location', 'العنوان', 'شوێن')),
                  Container(
                    height: 73.h,
                    width: 1.w,
                    color: Colors.black.withOpacity(.2),
                  ),
                  cardinfo(
                    text2: '5,000',
                    text3: '3,000',
                    text1: translateString(
                        'Delivery Fee', 'تكلفة  التوصيل', 'کرێی گەیاندن'),
                  ),
                ],
              ),
            ),
            SizedBox(height: he * 0.025
                //  30.h,
                ),
            cardItem(),
            cardItem(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: (prefs.getString("lang") == "en") ? .315 * he : .347 * he,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: MyColors.colorWhite,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(129, 129, 129, 0.1),
                        spreadRadius: 0,
                        blurRadius: 20,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                translateString(
                                    'Sub total', 'المجموع الفرعي', 'بەشی گشتی'),
                              ),
                              Text(
                                '\$100',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                translateString('Delivery Fee', 'تكلفة  التوصيل',
                                    'کرێی گەیاندن'),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '\$5,000',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9.w),
                          child: Row(
                            children: [
                              Text(
                                '- - - -  - - - - - - - - - - - - - - - - - - -',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                translateString('Total', 'المجموع', 'کۆی گشتی'),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '\$5,100',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic',
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: GestureDetector(
                  onTap: () {
                    showLoadingDialog();
                  },
                  child: ButtomSendOerder(
                      text1: translateString(
                          'Send Order', 'أرسال الطلب', ' ناردنی ڕێکخستن')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class cardItem extends StatelessWidget {
  const cardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // SizedBox(
          //   height: 10.h,
          // ),
          Container(
            height: ScreenUtil().setHeight(109),
            width: ScreenUtil().setWidth(314),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(129, 129, 129, 0.1),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/item.png',
                    height: ScreenUtil().setHeight(100),
                    width: ScreenUtil().setWidth(100),
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 10,
                      ),
                      child: Text(
                        'Protein',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: (prefs.getString("lang") == "en")
                                ? 'Metropolis'
                                : 'Noto Naskh Arabic',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        left: 10,
                      ),
                      child: Text(
                        'Protein',
                        style: TextStyle(
                            fontFamily: (prefs.getString("lang") == "en")
                                ? 'Metropolis'
                                : 'Noto Naskh Arabic',
                            color: Color.fromRGBO(117, 117, 117, 1),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 10,
                      ),
                      child: Text(
                        '\$100',
                        style: TextStyle(
                            fontFamily: (prefs.getString("lang") == "en")
                                ? 'Metropolis'
                                : 'Noto Naskh Arabic',
                            color: MyColors.mainColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(90),
                ),
                Column(
                  children: [
                    add_deletButtom(
                      top: 12,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
        ],
      ),
    );
  }
}
