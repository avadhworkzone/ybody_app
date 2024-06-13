import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';

class add_deletButtom extends StatefulWidget {
  add_deletButtom({
    super.key,
    required this.top,
  });
  final double top;

  Function()? ontap;
  @override
  State<add_deletButtom> createState() => _add_deletButtomState();
}

int _counter = 0;

class _add_deletButtomState extends State<add_deletButtom> {
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
      padding: EdgeInsets.only(top: widget.top, bottom: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _dicrementCounter(),
                child: Container(
                    height: ScreenUtil().setHeight(30),
                    width: ScreenUtil().setWidth(30),
                    decoration: BoxDecoration(
                      color: MyColors.colorBlack,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        '-',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              SizedBox(
                height: 3.h,
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
                height: 7.h,
              ),
              GestureDetector(
                onTap: () => _incrementCounter(),
                child: Container(
                    height: ScreenUtil().setHeight(30),
                    width: ScreenUtil().setWidth(30),
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
                            fontSize: 18,
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
