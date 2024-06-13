import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/business%20logic/cubit/app_cubit/appcubit_cubit.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/widget/custom_error_screen.dart';
import 'package:x_fitness/core/widget/custom_loading_indicator.dart';
import 'package:x_fitness/models/categories/category_model.dart';
import 'package:x_fitness/pressentaion/home/manager/categories_cubit.dart';
import 'package:x_fitness/pressentaion/home/widgets/adsbanner.dart';
import 'package:x_fitness/pressentaion/home/widgets/custom_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var arabicWords = {};
  var kurdishWords = {};

  getData() async {
    final String arabicResponse =
        await rootBundle.loadString('assets/lang/ar.json');
    final arabicData = await json.decode(arabicResponse);
    arabicWords = arabicData;
    final String kurdishResponse =
        await rootBundle.loadString('assets/lang/ar.json');
    final kurdishData = await json.decode(kurdishResponse);
    kurdishWords = kurdishData;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  final webViewUrl = "https://app.vectary.com/p/1Xy1ObNcqJyRDGS3LSQFoV";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var h = MediaQuery.of(context).size.height;
        return Scaffold(
          backgroundColor: MyColors.backgroundColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: .08 * h, left: 100, right: 100),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: screenHeight(context) * 0.1,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 20.h),
                const AdsImageBanner(
                  imageUrls: [
                    'assets/images/unsplash_MsCgmHuirDo.png',
                    'assets/images/sportswear.jpg',
                    'assets/images/unsplash_MsCgmHuirDo.png',
                    'assets/images/sportswear.jpg'
                  ],
                ),
                Center(
                  child: Text(
                    translateString(
                        'Select a category', 'أختر القسم ', 'هەڵبژاردنی بەش'),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: MyColors.textColor,
                        fontFamily: (prefs.getString("lang") == "en")
                            ? 'Metropolis'
                            : 'Noto Naskh Arabic'),
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<CategoriesCubit, CategoriesState>(
                    builder: (context, state) {
                  if (state is CategoriesSuccess) {
                    List<Category> categories = state.categories;
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        padding: EdgeInsets.only(
                            right: ScreenUtil().setWidth(25),
                            left: ScreenUtil().setWidth(25)),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (context, index) {
                          Category category = categories[index];
                          return customContainer(
                            ontap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => state.views[index],
                                ),
                              );
                            },
                            image:
                                'http://dev.sanamedia.net/${category.coverImage}',
                            title: translateString(category.nameEn,
                                category.nameAr, category.nameKu),
                          );
                        });
                  } else if (state is CategoriesFailure) {
                    print('error msg is ${state.errorMessage}');
                    return CustomErrorScreen(errorMessage: state.errorMessage);
                  } else {
                    return const CustomLoadingIndicator();
                  }
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
