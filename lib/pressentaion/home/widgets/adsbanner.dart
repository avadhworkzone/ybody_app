import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';

class AdsImageBanner extends StatefulWidget {
  final List<String> imageUrls;

  const AdsImageBanner({Key? key, required this.imageUrls}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<AdsImageBanner> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(25),
          left: ScreenUtil().setWidth(25),
          bottom: 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 100.h,
                  child: PageView.builder(
                    pageSnapping: true,
                    controller: _pageController,
                    itemCount: widget.imageUrls.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.h),
                        child: Image.asset(
                          widget.imageUrls[index],
                          fit: BoxFit.fill,
                          width: 387.w,
                          height: 100.h,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  left: 1,
                  right: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.imageUrls.length,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: _currentIndex == index ? 23 : 10,
                        height: 10,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _currentIndex == index
                              ? MyColors.mainColor
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //     top: 10.h,
                //     left: 100.w,
                //     right: 100.w,
                //     child: Text(
                //       "ads",
                //       style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.w700,
                //           color: MyColors.colorWhite,
                //           fontFamily: (prefs.getString("lang") == "en")
                //               ? 'Metropolis'
                //               : 'Noto Naskh Arabic'),
                //     ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
