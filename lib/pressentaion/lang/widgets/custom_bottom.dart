import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_fitness/business%20logic/cubit/app_cubit/appcubit_cubit.dart';
import 'package:x_fitness/core/constant/colors.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/pressentaion/Gander/genderscreen.dart';

import '../../Gander/test_gender.dart';

class Continue_customBottom extends StatelessWidget {
  const Continue_customBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 51, horizontal: 40),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const
                      // GenderScreen()
                      TestGenderScreen()));
            },
            child: Container(
              // width: width.width,
              height: 50,
              decoration: const BoxDecoration(
                color: MyColors.mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    translateString("Continue", "استمر", 'بەردەوامبوون'),
                    // 'Continue',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: MyColors.colorWhite,
                        fontFamily: (prefs.getString("lang") == "en")
                            ? 'Metropolis'
                            : 'Noto Naskh Arabic'),
                  ),
                  Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: MyColors.colorWhite,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
