import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/pressentaion/layout/layout.dart';
import 'package:x_fitness/utils/local_storage.dart';
import 'package:x_fitness/utils/shared_preference/shared_preference_services.dart';

class TestGenderScreen extends StatefulWidget {
  const TestGenderScreen({super.key});

  @override
  State<TestGenderScreen> createState() => _TestGenderScreenState();
}

class _TestGenderScreenState extends State<TestGenderScreen> {
  int? _selectedLang;
  RxBool isMaleAnimating = true.obs;
  RxBool isFemaleAnimating = true.obs;
  bool isNext = false;
  RxBool femaleSelect = false.obs;
  RxBool maleSelect = false.obs;
  //
  // var controller = WebViewController()
  //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //   ..setBackgroundColor(const Color(0x00000000))
  //   ..setNavigationDelegate(
  //     NavigationDelegate(
  //       onProgress: (int progress) {
  //
  //       },
  //       onPageStarted: (String url) {},
  //       onPageFinished: (String url) {},
  //       onWebResourceError: (WebResourceError error) {
  //         print("Web Resource Error: $error");
  //       },
  //       onNavigationRequest: (NavigationRequest request) {
  //         if (request.url.startsWith('https://www.youtube.com/')) {
  //           return NavigationDecision.prevent;
  //         }
  //         return NavigationDecision.navigate;
  //       },
  //     ),
  //   )
  //   ..loadRequest(
  //       Uri.parse('https://app.vectary.com/p/1Xy1ObNcqJyRDGS3LSQFoV'));

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size;
    var h = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyColors.white,
      // backgroundColor: MyColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
            child: Image.asset(
              // 'assets/images/Logo.png',
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
          SizedBox(height: 22.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10
                // horizontal: 10
                // horizontal: 53.w, vertical: 22.h
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // isMaleAnimating = false;
                        // isFemaleAnimating = true;
                        _selectedLang = 0;
                      });
                    },
                    child: Container(
                      height: 320,
                      // width: screenWidth(context) * .29,
                      decoration: BoxDecoration(
                        // color: MyColors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(
                        //   color: _selectedLang == 0
                        //       ? MyColors.dividerColor.withOpacity(.8)
                        //       : Colors.transparent,
                        //   width: 2,
                        // ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Obx(() => Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Visibility(
                                    visible: isMaleAnimating.value,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isMaleAnimating.value = false;
                                          if (!isFemaleAnimating.value) {
                                            isFemaleAnimating.value = true;
                                          }
                                        });
                                      },
                                      child: Lottie.asset(
                                        // 'assets/lottie/male_idle.json',
                                        "assets/lottie/male_selection.json",
                                        height: 260,
                                      ),
                                    ),
                                  ),

                                  // Lottie.asset(
                                  //   'assets/lottie/male_idle.json',
                                  //   height: 260,
                                  //   // height: 200,
                                  //   animate: isMaleAnimating,
                                  // )
                                  // Image.asset('assets/images/ph_gender-male.png'),
                                )),
                            Obx(() => Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                        color: maleSelect == true
                                            ? MyColors.colorBlack
                                                .withOpacity(0.3)
                                            : MyColors.transparent,
                                      )),
                                  child: Visibility(
                                    visible: !isMaleAnimating.value,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isMaleAnimating.value = true;
                                          if (!isFemaleAnimating.value) {
                                            isFemaleAnimating.value = true;
                                          }
                                        });
                                      },
                                      child: Lottie.asset(
                                        'assets/lottie/male_selection.json',
                                        onLoaded: (v) {
                                          maleSelect.value = true;
                                        },
                                        // 'assets/lottie/female_idle.json',
                                        height: 260,
                                      ),
                                    ),
                                  ),
                                )),
                            Obx(() => isMaleAnimating.value == false
                                ? Container(
                                    alignment: Alignment.center,
                                    // color: Colors.grey,
                                    width: 100.0,
                                    height: 50,
                                    child: DefaultTextStyle(
                                      style: const TextStyle(
                                        fontSize: 40.0,
                                        color: MyColors.mainColor,
                                        fontFamily: 'Canterbury',
                                      ),
                                      child: AnimatedTextKit(
                                        repeatForever: true,
                                        animatedTexts: [
                                          FadeAnimatedText("Let's"),
                                          FadeAnimatedText('Go!'),
                                        ],
                                        onTap: () {
                                          print("Tap Event");
                                        },
                                      ),
                                    ),
                                  )
                                : const SizedBox())
                            // Text(translateString("Male", 'ذكر', 'نێر'),
                            //     style: TextStyle(
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.w400,
                            //         color: MyColors.colorBlack2,
                            //         fontFamily: (prefs.getString("lang") == "en")
                            //             ? 'Metropolis'
                            //             : 'Noto Naskh Arabic')),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     top: 40,
                //     bottom: 20,
                //   ),
                //   child: Container(
                //     color: MyColors.mainColor,
                //     // width: width.width,
                //     height: 74,
                //     width: 1,
                //     // color: MyColors.BottomColor1,
                //     child: const Row(),
                //   ),
                // ),
                SizedBox(width: 10.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // isFemaleAnimating = false;
                        // isMaleAnimating = true;
                        _selectedLang = 1;
                      });
                    },
                    child: Container(
                      height: 320,
                      width: 180,
                      // width: 250,
                      decoration: BoxDecoration(
                        // color: MyColors.colorWhite,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(
                        //   color: _selectedLang == 1
                        //       ? MyColors.dividerColor.withOpacity(.8)
                        //       : Colors.transparent,
                        //   width: 2,
                        // ),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(2.0),
                            //   child: Visibility(
                            //     visible: isFemaleAnimating,
                            //     child: GestureDetector(
                            //       onTap: () {
                            //         setState(() {
                            //           isFemaleAnimating = false;
                            //           if (!isMaleAnimating) {
                            //             isMaleAnimating = true;
                            //           }
                            //         });
                            //       },
                            //       child: Lottie.asset(
                            //           'assets/lottie/female_idle.json',
                            //           // 'assets/lottie/female_idle.json',
                            //           height: 260, ),
                            //     ),
                            //   ),
                            //   // Lottie.asset(
                            //   //   'assets/lottie/male_stretch.json',
                            //   //   height: 260,
                            //   //   // width: 300,
                            //   //   animate: isFemaleAnimating,
                            //   // ),
                            // ),

                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Visibility(
                                visible: isFemaleAnimating.value,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFemaleAnimating.value = false;
                                      if (!isMaleAnimating.value) {
                                        isMaleAnimating.value = true;
                                      }
                                    });
                                  },
                                  child: Lottie.asset(
                                    'assets/lottie/female_idle.json',
                                    // 'assets/lottie/loader.json',
                                    height: 260,
                                  ),
                                ),
                              ),

                              // Lottie.asset(
                              //   'assets/lottie/male_idle.json',
                              //   height: 260,
                              //   // height: 200,
                              //   animate: isMaleAnimating,
                              // )
                              // Image.asset('assets/images/ph_gender-male.png'),
                            ),

                            Obx(
                              () => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: femaleSelect == false
                                            ? MyColors.transparent
                                            : MyColors.colorBlack
                                                .withOpacity(0.3))),
                                child: Visibility(
                                  visible: !isFemaleAnimating.value,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isFemaleAnimating.value = true;
                                        if (!isMaleAnimating.value) {
                                          isMaleAnimating.value = true;
                                        }
                                      });
                                    },
                                    child: Lottie.asset(
                                        'assets/lottie/female_select.json',
                                        height: 260, onLoaded: (v) {
                                      femaleSelect.value = true;
                                      print("-======================  $v");
                                    }),
                                  ),
                                ),
                              ),
                            ),
                            Obx(() => isFemaleAnimating.value == false
                                ? Container(
                                    alignment: Alignment.center,
                                    // color: Colors.grey,
                                    width: 100.0,
                                    height: 50,
                                    child: DefaultTextStyle(
                                      style: const TextStyle(
                                        fontSize: 40.0,
                                        color: MyColors.mainColor,
                                        fontFamily: 'Canterbury',
                                      ),
                                      child: AnimatedTextKit(
                                        repeatForever: true,
                                        animatedTexts: [
                                          FadeAnimatedText(
                                            "Let's",
                                          ),
                                          FadeAnimatedText('Go!'),
                                        ],
                                        onTap: () {
                                          print("Tap Event");
                                        },
                                      ),
                                    ),
                                  )
                                : const SizedBox())
                            // Text(translateString("Female", "أنثي", 'مێ'),
                            //     style: TextStyle(
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.w400,
                            //         color: MyColors.colorBlack2,
                            //         fontFamily: (prefs.getString("lang") == "en")
                            //             ? 'Metropolis'
                            //             : 'Noto Naskh Arabic')),
                          ],
                        ),
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

                var abc = setDataToLocalStorage(
                  dataType: LocalStorage.boolType,
                  prefKey: LocalStorage.next,
                  boolData: isNext,
                );
                print("$abc");
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
