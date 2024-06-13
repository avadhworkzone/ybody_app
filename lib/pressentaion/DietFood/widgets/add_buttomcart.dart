import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';

class addAndDeletButtomTocart extends StatefulWidget {
  addAndDeletButtomTocart({
    super.key,
  });

  Function()? ontap;
  @override
  State<addAndDeletButtomTocart> createState() => _add_deletButtomState();
}

int _counter = 0;

class _add_deletButtomState extends State<addAndDeletButtomTocart> {
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _dicrementCounter() {
    setState(() {
      _counter-- == 0 ? _counter = 0 : _counter--;
    });
  }

  @override
  int basketCount = 2;
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.w, right: 40.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _dicrementCounter(),
                child: Container(
                    height: ScreenUtil().setHeight(40),
                    width: ScreenUtil().setWidth(40),
                    decoration: BoxDecoration(
                      color: MyColors.colorBlack,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        '-',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 33,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              SizedBox(
                width: 12.h,
              ),
              Text(
                '$_counter ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: (prefs.getString("lang") == "en")
                        ? 'Metropolis'
                        : 'Noto Naskh Arabic',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 12.h,
              ),
              GestureDetector(
                onTap: () => _incrementCounter(),
                child: Container(
                    height: ScreenUtil().setHeight(40),
                    width: ScreenUtil().setWidth(40),
                    decoration: BoxDecoration(
                      color: MyColors.colorBlack,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(
                            fontFamily: (prefs.getString("lang") == "en")
                                ? 'Metropolis'
                                : 'Noto Naskh Arabic',
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
