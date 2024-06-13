import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/pressentaion/layout/layout.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int? _selectedLang;
  bool isMaleAnimating = false;

  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(
        Uri.parse('https://app.vectary.com/p/1Xy1ObNcqJyRDGS3LSQFoV'));

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size;
    var h = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 100, right: 100),
            child: Image.asset(
              'assets/images/logo.png',
              // width: screenWidth(context) * 0.3,
              height: screenHeight(context) * 0.1,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            translateString(
                'Select your gender', 'اختر النوع', 'هەڵبژاردنی بەش'),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: MyColors.textColor,
                fontFamily: (prefs.getString("lang") == "en")
                    ? 'Metropolis'
                    : 'Noto Naskh Arabic'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 53.w, vertical: 22.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMaleAnimating = true;
                      _selectedLang = 0;
                    });
                  },
                  child: Container(
                    height: screenWidth(context) * .5,
                    width: screenWidth(context) * .29,
                    decoration: BoxDecoration(
                      color: MyColors.colorWhite,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _selectedLang == 0
                            ? MyColors.dividerColor.withOpacity(.8)
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Lottie.asset(
                                'assets/lottie/new.json',
                                animate: isMaleAnimating,
                              )
                              // Image.asset('assets/images/ph_gender-male.png'),
                              ),
                          Text(translateString("Male", 'ذكر', 'نێر'),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.colorBlack2,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic')),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    bottom: 20,
                  ),
                  child: Container(
                    color: MyColors.mainColor,
                    // width: width.width,
                    height: 74,
                    width: 1,
                    // color: MyColors.BottomColor1,
                    child: const Row(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMaleAnimating = false;
                      _selectedLang = 1;
                    });
                  },
                  child: Container(
                    height: screenWidth(context) * .5,
                    width: screenWidth(context) * .29,
                    decoration: BoxDecoration(
                      color: MyColors.colorWhite,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _selectedLang == 1
                            ? MyColors.dividerColor.withOpacity(.8)
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/images/Vector.png'),
                          ),
                          Text(translateString("Female", "أنثي", 'مێ'),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.colorBlack2,
                                  fontFamily: (prefs.getString("lang") == "en")
                                      ? 'Metropolis'
                                      : 'Noto Naskh Arabic')),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Image.asset('assets/animation.gif',height: 300,)
          // if (_selectedLang != null)
          //   Lottie.asset(
          //     _selectedLang == 0
          //         ? 'assets/lottie/new.json'
          //         : 'assets/lottie/female_gym.json',
          //     // ? 'assets/lottie/male_gym.json'
          //     //     : 'assets/lottie/female_gym.json',
          //     // 'assets/lottie/male_gym.json',
          //     width: 300,
          //     height: 300,
          //   ),
          // Expanded(
          //   child: Container(
          //       height: 300,
          //       width: 500,
          //       child: WebViewWidget(controller: controller)),
          // ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context) * .08,
            vertical: screenHeight(context) * .04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const AppLayoutScreen()));
              },
              child: Container(
                height: 48,
                width: 145,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: MyColors.dividerColor.withOpacity(.8),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      translateString("Skip", "تخطي", 'لابردن'),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: MyColors.colorBlack,
                          fontFamily: (prefs.getString("lang") == "en")
                              ? 'Metropolis'
                              : 'Noto Naskh Arabic'),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const AppLayoutScreen()));
              },
              child: Container(
                height: 48,
                width: 145,
                decoration: const BoxDecoration(
                  color: MyColors.mainColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      translateString("Next", "التالي", 'دواتر'),
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.colorWhite,
                        fontFamily: (prefs.getString("lang") == "en")
                            ? 'Metropolis'
                            : 'Noto Naskh Arabic',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
