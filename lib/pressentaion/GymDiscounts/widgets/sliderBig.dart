import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:x_fitness/core/constant/colors.dart';

class ImageSliderB extends StatefulWidget {
  final List<String> imageUrls;

  const ImageSliderB({Key? key, required this.imageUrls}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSliderB> {
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
      mainAxisAlignment: MainAxisAlignment.center,
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
                child: PhotoView(
                  imageProvider: Image.network(
                    "https://dev.sanamedia.net/${widget.imageUrls[index]}",
                    fit: BoxFit.fill,
                    width: 387.w,
                    height: 387.h,
                  ).image,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
