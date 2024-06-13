import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/pressentaion/Basket/widgets/add_buttom.dart';
import 'package:x_fitness/pressentaion/SupplementsCheckout/supplementsCheckout.screen.dart';

class BasketScreen extends StatefulWidget {
  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  List<dynamic> categoryImage = [
    'assets/images/unsplash_csOAWLFSnQY.png',
    'assets/images/unsplash_xeTv9N2FjXA.png',
    'assets/images/cashe.png',
    'assets/images/unsplash_H-qxKCedhcc.png',
    'assets/images/discount.png',
    'assets/images/imagecable 1.png',
  ];

  List<String> namesCetgory = [
    translateString('Supplements', 'المكملات الغذائية', 'تەواوکەرەکان'),
    translateString("Diet Food", "الطعام الصحي", "خواردنی دایێت"),
    translateString('   Equipment', 'المعدات          ', '          ئامێرەکان'),
    translateString("BASKET", "السلة", "سەبەتە"),
    translateString("BASKET", "السلة", "سەبەتە"),
    // 'Equipment’s',
    // 'Accessories',
    // 'SportWear',
  ];

  List<String> namesCetgoryType = [
    translateString('Keto Vegan', 'بروتين عضوي', ' ڕەنگەکان'),
    translateString('Fresh Salad', 'سلطة فريش', 'سەبەتە'),
    translateString('BMX Cycle', '  دورة البوكس', ' ڕەنگەکان'),
    translateString('Boxing Gloves', '  كرات البوكس  ', 'سەبەتە'),
    translateString('Nike Air Max', '  كرات البوكس', 'سەبەتە'),
  ];

  List<String> price = [
    '\$ 100',
    '\$ 200',
    '\$ 90',
    '\$ 70',
    '\$ 30',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 60.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  translateString("BASKET", "سلة التسوق", "سەبەتە"),
                  style: TextStyle(
                      color: MyColors.colorBlack2,
                      fontSize: 16.sp,
                      fontFamily: (prefs.getString("lang") == "en")
                          ? 'Metropolis'
                          : 'Noto Naskh Arabic',
                      fontWeight: FontWeight.w700),
                ),
              ),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                namesCetgory[index],
                                style: TextStyle(
                                    color: MyColors.colorBlack2,
                                    fontSize: 16.sp,
                                    fontFamily:
                                        (prefs.getString("lang") == "en")
                                            ? 'Metropolis'
                                            : 'Noto Naskh Arabic',
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
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
                                Image.asset(
                                  categoryImage[index],
                                  height: ScreenUtil().setHeight(110),
                                  width: ScreenUtil().setWidth(100),
                                  fit: BoxFit.contain,
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
                                        namesCetgoryType[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontFamily:
                                                (prefs.getString("lang") ==
                                                        "en")
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
                                        translateString(
                                            'Protein', '  بروتين', 'ڕەنگەکان'),
                                        style: TextStyle(
                                            fontFamily:
                                                (prefs.getString("lang") ==
                                                        "en")
                                                    ? 'Metropolis'
                                                    : 'Noto Naskh Arabic',
                                            color: const Color.fromRGBO(
                                                117, 117, 117, 1),
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
                                        price[index],
                                        style: TextStyle(
                                            fontFamily:
                                                (prefs.getString("lang") ==
                                                        "en")
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
                                  width: ScreenUtil().setWidth(60),
                                ),
                                Column(
                                  children: [
                                    add_deletButtom(
                                      top: 10,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SupplementsCheckoutscreen()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    height: ScreenUtil().setHeight(48),
                                    width: ScreenUtil().setWidth(
                                        namesCetgory[index] == "Supplements"
                                            ? 230
                                            : 146),
                                    decoration: BoxDecoration(
                                      color: MyColors.mainColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        namesCetgory[index] == "Supplements"
                                            ? "order Selected diet foods"
                                            : translateString("Order Now",
                                                "اطلب الان", "داواکردن"),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: namesCetgory[index] ==
                                                    "Supplements"
                                                ? 16.sp
                                                : 16.sp,
                                            fontFamily:
                                                (prefs.getString("lang") ==
                                                        "en")
                                                    ? 'Metropolis'
                                                    : 'Noto Naskh Arabic',
                                            fontWeight: FontWeight.bold),
                                        // maxLines: 2,
                                        // textAlign: TextAlign.center,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ) //Text('Total: \$ 0.00'),
                                    ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Divider(
                            color: Color.fromRGBO(117, 117, 117, 1),
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
