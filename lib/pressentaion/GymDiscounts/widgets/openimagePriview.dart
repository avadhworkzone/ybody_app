import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';

class ImageSliderBB extends StatefulWidget {
  final List<String> imageUrls;

  const ImageSliderBB({Key? key, required this.imageUrls}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSliderBB> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 380.h,
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
                      child: Image.network(
                        "https://dev.sanamedia.net/${widget.imageUrls[index]}",
                        fit: BoxFit.fill,
                        width: 387.w,
                        height: 387.h,
                      ));
                },
              ),
            ),
            Positioned(
              bottom: 19.h,
              left: 1,
              right: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.imageUrls.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: _currentIndex == index ? 23 : 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
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
          ],
        ),
      ],
    );
  }
}
