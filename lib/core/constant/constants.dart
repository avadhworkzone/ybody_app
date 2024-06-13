import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:x_fitness/core/constant/colors.dart';

late SharedPreferences prefs;
Future startShared() async {
  prefs = await SharedPreferences.getInstance();
}
/////////////////////////////////////////////////////////////////////

homeBottomSheet({context, child}) {
  var w = MediaQuery.of(context).size.width;

  return showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(w * 0.07),
          topLeft: Radius.circular(w * 0.07)),
    ),
    isDismissible: true,
    context: context,
    builder: (context) => child,
  );
}
////////////////////////////////////////////////////////////////////

String translateString(String a, String b,String c) {
  if (prefs.getString("lang") != null) {
    if (prefs.getString("lang") == "en") {
      return a;
    } else if (prefs.getString("lang") == "ar") {
      return b;
    } else {
      return c;
    }
  } else {
    return Platform.localeName.split('_')[0] == 'en' ? a : b;
  }
}

////////////////////////////////////////////////////////////////////

void dialog(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        child: Opacity(
          opacity: 0.7,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black12,
            child: Center(
              child: CircularProgressIndicator(
                color: MyColors.mainColor,
              ),
            ),
          ),
        ),
        onWillPop: () async => false,
      );
    },
  );
}

///////////////////////////////////////////////////////////////////////////////

customCachedNetworkImage(
    {required String url, required context, required BoxFit fit}) {
  try {
    // ignore: unnecessary_null_comparison
    if (url == null || url == "") {
      return const Icon(
        Icons.error,
        color: Color(0xffAB0D03),
      );
    } else {
      return Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: (Uri.parse(url).isAbsolute)
            ? CachedNetworkImage(
                imageUrl: url,
                fit: fit,
                placeholder: (context, url) => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                      height: MediaQuery.of(context).size.height * 0.02,
                      child: Image.asset(
                        "assets/icons/LOGO.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                errorWidget: (context, url, error) {
                  // ignore: prefer_const_constructors
                  return Icon(
                    Icons.error,
                    color: const Color(0xffAB0D03),
                  );
                })
            : const Icon(
                Icons.error,
                color: Color(0xffAB0D03),
              ),
      );
    }
  } catch (e) {
    // ignore: avoid_print
    print(e.toString());
  }
}

///////////////////////////////////////////////////////////

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}
////////////////////////////////////////////////////////////////////

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

////////////////////////////////////////////////////////////////////

Widget suffixshape(
    {required String image, Color? suffixColor, required context}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: CircleAvatar(
      radius: screenWidth(context) * 0.051,
      backgroundColor: MyColors.mainColor,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: screenWidth(context) * 0.05,
        child: Image.asset(
          image,
          color: (suffixColor != null) ? suffixColor : MyColors.mainColor,
          width: MediaQuery.of(context).size.width * 0.06,
          fit: BoxFit.contain,
        ),
      ),
    ),
    // ),
  );
}
