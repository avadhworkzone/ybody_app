import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_fitness/business%20logic/cubit/app_cubit/appcubit_cubit.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/constant/localization.dart';
import 'package:x_fitness/pressentaion/lang/widgets/custom_bottom.dart';
import 'package:x_fitness/pressentaion/lang/widgets/langbottom.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int _selectedLang = 0;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size;
    var h = MediaQuery.of(context).size;
    var dropValue = 'ar';

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // if (state is ChangeLanguageState) {
        //   if (state.lang == 'en') {
        //     setState(() {
        //       setState(() {
        //         _selectedLang = 0;
        //         setLocale(prefs.getString("lang") ?? 'en');
        //         AppCubit.get(context).changeLanguage();
        //       });
        //     });
        //   } else if (state.lang == 'ar') {
        //     setState(() {
        //                 _selectedLang = 1;
        //       setLocale(prefs.getString("lang") ?? 'ar');
        //       AppCubit.get(context).changeLanguage();
        //     });
        //   } else if (state.lang == 'kr') {
        //     setState(() {
        //       setLocale(prefs.getString("lang") ?? 'kr');
        //       AppCubit.get(context).changeLanguage();
        //     });
        //   }
        // }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: MyColors.backgroundColor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 90, left: 100, right: 100),
                  child: Image.asset(
                    'assets/images/logo.png',
                    // 'assets/images/Logo.png',
                    height: screenHeight(context) * 0.1,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  // Choose your language
                  translateString(
                      "Choose your language", " اختر لغتك", 'هەڵبژاردنی زمان'),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: MyColors.textColor,
                      fontFamily: (prefs.getString("lang") == "en")
                          ? 'Metropolis'
                          : 'Noto Naskh Arabic'),
                ),
                SizedBox(
                  height: h.height * .025,
                ),
                //English language
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedLang = 0;
                      dropValue = 'en';
                      setLocale(dropValue);
                      AppCubit.get(context).changeLanguage();
                    });
                  },
                  child: LanguageBottom(
                      color: _selectedLang == 0
                          ? MyColors.BottomColor1.withOpacity(.3)
                          : Colors.transparent,
                      flag: Image.asset('assets/images/uk.png', height: 20),
                      // flag: Image.asset('assets/images/USA 1.png'),
                      arrow: Image.asset('assets/images/Group.png',
                          color: _selectedLang == 0
                              ? MyColors.mainColor
                              : MyColors.backgroundColor),
                      text: 'English',
                      FontFamily: (prefs.getString("lang") == "en")
                          ? 'Metropolis'
                          : 'Noto Naskh Arabic'),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: Container(
                    color: MyColors.dividerColor,
                    height: 1,
                    child: Row(),
                  ),
                ),

                //arabic language
                GestureDetector(
                  onTap: () {
                    setState(() {
                      dropValue = 'ar';
                      setLocale(dropValue);
                      AppCubit.get(context).changeLanguage();
                      _selectedLang = 1;
                      // setLocale(prefs.getString("lang") ?? 'en');
                      // AppCubit.get(context).changeLanguage();
                    });
                  },
                  child: LanguageBottom(
                    color: _selectedLang == 1
                        ? MyColors.BottomColor1.withOpacity(.3)
                        : Colors.transparent,
                    flag: Image.asset('assets/images/arabic 1.png'),
                    arrow: Image.asset('assets/images/Group.png',
                        color: _selectedLang == 1
                            ? MyColors.mainColor
                            : MyColors.backgroundColor),
                    text: 'عربي',
                    FontFamily: 'Noto Naskh Arabic',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: Container(
                    color: MyColors.dividerColor,
                    height: 1,
                    child: Row(),
                  ),
                ),

                //
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedLang = 2;
                      dropValue = 'kr';
                      setLocale(dropValue);
                      AppCubit.get(context).changeLanguage();
                    });
                  },
                  child: LanguageBottom(
                    color: _selectedLang == 2
                        ? MyColors.BottomColor1.withOpacity(.3)
                        : Colors.transparent,
                    flag:
                        Image.asset('assets/images/icons8-kurdistan-48 1.png'),
                    arrow: Image.asset('assets/images/Group.png',
                        color: _selectedLang == 2
                            ? MyColors.mainColor
                            : MyColors.backgroundColor),
                    text: 'كردي',
                    FontFamily: 'Noto Naskh Arabic',
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const Continue_customBottom());
      },
    );
  }
}
