import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:x_fitness/business%20logic/cubit/app_cubit/appcubit_cubit.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/constant/localization.dart';
import 'package:x_fitness/core/helper/assets.dart';
import 'package:x_fitness/main.dart';

import 'widgets/textfield_user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

List<String> list = <String>[
  translateString('male', 'ذكر', 'نێر'),
  translateString('Female', 'أنثي', 'مێ')
];
List<String> lists = <String>['عربي', 'كردي', 'English'];

class _ProfileScreenState extends State<ProfileScreen> {
  // ImagePicker picker = ImagePicker();
  File? image;
  String dropdownValue = list.first;
  String dropdownValues = 'en';

  ///lists.first;
  String dropValue = 'ar';
  String _selectedGender = 'm';
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Container(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 55.h),
            child: Column(
              children: [
                Center(
                    child: Text(
                  translateString("Profile", "الحساب الشخصي", "پڕۆفایل"),
                  style: TextStyle(
                      color: MyColors.colorBlack2,
                      fontFamily: (prefs.getString("lang") == "en")
                          ? 'Metropolis'
                          : 'Noto Naskh Arabic',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                )),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(40),
                    right: ScreenUtil().setWidth(40),
                    bottom: ScreenUtil().setWidth(10),
                  ),
                  child: Container(
                      height: 780.h,
                      width: 310.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 15.h),
                          Stack(
                            children: [
                              Container(
                                height: 148.h,
                                width: 145.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Image.asset(
                                                    'assets/images/prfile.png',
                                                    fit: BoxFit.contain,
                                                  )));
                                    },
                                    child: Image.asset(
                                      'assets/images/prfile.png',
                                      fit: BoxFit.contain,
                                    )),
                              ),
                              Positioned(
                                top: .33 * we,
                                left: .28 * we,
                                right: 5,
                                child: GestureDetector(
                                  onTap: getImage,
                                  child: Container(
                                    width: 40.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(6.w),
                                      child: SvgPicture.asset(
                                        'assets/images/galleryadd.svg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          textfiledUser(
                            text: 'Guest01932',
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            icon2: SvgPicture.asset(AssetsData.USERICON),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          textfiledUser(
                            text: translateString(
                                'phoneNumber', "رقم الهاتف", " ژمارەی تۆلەفۆن"),
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            icon2: SvgPicture.asset(AssetsData.PHONE),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          textfiledUser(
                            text: translateString(' Erbil , Iraq',
                                'العراق,اربيل', ' عێراق،ئێربیل'),
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            icon2: SvgPicture.asset(AssetsData.LOACTION),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: ScreenUtil().setWidth(20),
                                left: ScreenUtil().setWidth(20)),
                            child: Container(
                              width: 270.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(129, 129, 129, 0.1),
                                    spreadRadius: 4,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(15.h),
                                    child: SvgPicture.asset(
                                      AssetsData.LANGUAGE,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  DropdownButton<String>(
                                    value: prefs.getString("lang") ??
                                        dropdownValues,
                                    icon: Row(
                                      children: [
                                        SizedBox(
                                          width: .26 * we,
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down_circle_outlined,
                                        ),
                                      ],
                                    ),
                                    elevation: 16,
                                    // style: const TextStyle(color: Colors.deepPurple),
                                    underline: Container(
                                      height: 2,
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownValues = value ?? "ar";
                                        setLocale(dropdownValues);
                                        AppCubit.get(context).changeLanguage();
                                        // ui.window.scheduleMicrotask(() => ui.window.restart());
                                      });
                                    },
                                    items: const [
                                      DropdownMenuItem(
                                        value: "ar",
                                        child: Text("عربي"),
                                      ),
                                      DropdownMenuItem(
                                        value: "en",
                                        child: Text("en"),
                                      ),
                                      DropdownMenuItem(
                                        value: "kr",
                                        child: Text("كردي"),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: ScreenUtil().setWidth(20),
                                left: ScreenUtil().setWidth(20)),
                            child: Container(
                              width: 270.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(129, 129, 129, 0.1),
                                    spreadRadius: 4,
                                    blurRadius: 20,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(15.h),
                                    child: SvgPicture.asset(
                                      AssetsData.Gendermale,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  DropdownButton<String>(
                                    value: _selectedGender,
                                    icon: Row(
                                      children: [
                                        SizedBox(
                                          width: .26 * we,
                                        ),
                                        const Icon(
                                          Icons.arrow_drop_down_circle_outlined,
                                        ),
                                      ],
                                    ),
                                    elevation: 16,
                                    // style: const TextStyle(color: Colors.deepPurple),
                                    underline: Container(
                                      height: 2,
                                    ),
                                    onChanged: (String? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        dropdownValue = value!;
                                      });
                                    },
                                    items: [
                                      DropdownMenuItem(
                                        value: "m",
                                        child: Text(translateString(
                                            'Male', 'ذكر', 'نێر')),
                                      ),
                                      DropdownMenuItem(
                                        value: "f",
                                        child: Text(translateString(
                                            'Female', 'انثي', 'مێ')),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          textfiledUser(
                            // text: translateString(' Erbil , Iraq',
                            //     'العراق,اربيل', ' عێراق،ئێربیل'),
                            text: 'Model: ${model}',
                            // icon: const Icon(
                            //   Icons.edit,
                            //   color: Colors.black,
                            // ),
                            // icon2: SvgPicture.asset(AssetsData.LOACTION),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          textfiledUser(
                            // text: translateString(' Erbil , Iraq',
                            //     'العراق,اربيل', ' عێراق،ئێربیل'),
                            text: 'OsName: ${osName}',
                            // icon: const Icon(
                            //   Icons.edit,
                            //   color: Colors.black,
                            // ),
                            // icon2: SvgPicture.asset(AssetsData.LOACTION),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          textfiledUser(
                            // text: translateString(' Erbil , Iraq',
                            //     'العراق,اربيل', ' عێراق،ئێربیل'),
                            text: '${locationInfo}',
                            // icon: const Icon(
                            //   Icons.edit,
                            //   color: Colors.black,
                            // ),
                            // icon2: SvgPicture.asset(AssetsData.LOACTION),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          textfiledUser(
                            // text: translateString(' Erbil , Iraq',
                            //     'العراق,اربيل', ' عێراق،ئێربیل'),
                            text: 'Ip: ${ipAddress["ip"]}',
                            // icon: const Icon(
                            //   Icons.edit,
                            //   color: Colors.black,
                            // ),
                            // icon2: SvgPicture.asset(AssetsData.LOACTION),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(40),
                    right: ScreenUtil().setWidth(40),
                    bottom: ScreenUtil().setWidth(10),
                  ),
                  child: Container(
                      height: ScreenUtil().setHeight(48),
                      // width: ScreenUtil().setWidth(228),
                      decoration: BoxDecoration(
                        color: MyColors.mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          translateString('submit', 'تعديل', 'ناردن'),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'Metropolis',
                              fontWeight: FontWeight.bold),
                        ),
                      ) //Text('Total: \$ 0.00'),
                      ),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = image;
    });
  }
}
