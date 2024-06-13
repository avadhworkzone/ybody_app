import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/assets_data.dart';

class SoumtechLogoAuthScreens extends StatelessWidget {
  const SoumtechLogoAuthScreens({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 80.h,
        width: 150.w,
        //TODO: App logo of soumtech whith new logoooo
        child: Image.asset(
          MyAssetsData.soumtechLogoColored,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
