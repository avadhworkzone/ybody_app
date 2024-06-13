import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:location/location.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:x_fitness/core/constant/constants.dart';
import 'package:x_fitness/core/constant/localization.dart';
import 'package:x_fitness/pressentaion/Accessories/accessories_repo.dart';
import 'package:x_fitness/pressentaion/Accessories/manager/accessories_categories_cubit/accessories_categories_cubit.dart';
import 'package:x_fitness/pressentaion/Accessories/manager/all_accessories_cubit/all_accessories_cubit.dart';
import 'package:x_fitness/pressentaion/Accessories/manager/detailed_accessory_cubit/detailed_accessory_cubit.dart';
import 'package:x_fitness/pressentaion/Accessories/manager/filtered_accessories_cubit/filtered_accessory_cubit.dart';
import 'package:x_fitness/pressentaion/Coaches/coach_repo.dart';
import 'package:x_fitness/pressentaion/Coaches/manager/all_coaches_cubit/all_coaches_cubit.dart';
import 'package:x_fitness/pressentaion/DietFood/diet_food_repo.dart';
import 'package:x_fitness/pressentaion/DietFood/manager/all_diet_foods_cubit/all_diet_foods_cubit.dart';
import 'package:x_fitness/pressentaion/DietFood/manager/detailed_diet_food_cubit/detailed_diet_food_cubit.dart';
import 'package:x_fitness/pressentaion/DietFood/manager/filtered_foods_cubit/filtered_foods_cubit.dart';
import 'package:x_fitness/pressentaion/DietFood/manager/foods_categories_cubit/foods_categories_cubit.dart';
import 'package:x_fitness/pressentaion/GymDiscounts/gyms_repo.dart';
import 'package:x_fitness/pressentaion/GymDiscounts/manager/all_gyms_cubit/all_gyms_cubit.dart';
import 'package:x_fitness/pressentaion/Supplements/manager/all_supplements_cubit/all_supplements_cubit.dart';
import 'package:x_fitness/pressentaion/Supplements/manager/detailed_supplement_cubit/detailed_supplement_cubit.dart';
import 'package:x_fitness/pressentaion/Supplements/manager/filtered_supplements_cubit/filtered_supplements_cubit.dart';
import 'package:x_fitness/pressentaion/Supplements/manager/supplements_categories_cubit/supplements_categories_cubit.dart';
import 'package:x_fitness/pressentaion/Supplements/supplements_repo.dart';
import 'package:x_fitness/pressentaion/equilpemnet/equimpments_repo.dart';
import 'package:x_fitness/pressentaion/equilpemnet/manager/all_equipments_cubit/all_equipments_cubit.dart';
import 'package:x_fitness/pressentaion/equilpemnet/manager/detailed_equipment_cubit/detailed_equipment_cubit.dart';
import 'package:x_fitness/pressentaion/equilpemnet/manager/equipments_categories_cubit/equipments_categories_cubit.dart';
import 'package:x_fitness/pressentaion/equilpemnet/manager/filtered_equipments_cubit/filtered_equipments_cubit.dart';
import 'package:x_fitness/pressentaion/home/home_repo.dart';
import 'package:x_fitness/pressentaion/home/manager/categories_cubit.dart';
import 'package:x_fitness/pressentaion/splash/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:x_fitness/pressentaion/sportswear/manager/all_sports_wear_cubit/all_sports_wear_cubit.dart';
import 'package:x_fitness/pressentaion/sportswear/manager/detailed_sports_wear_cubit/detailed_sports_wear_cubit.dart';
import 'package:x_fitness/pressentaion/sportswear/manager/filtered_sports_wear_cubit/filtered_sports_wear_cubit.dart';
import 'package:x_fitness/pressentaion/sportswear/manager/sports_wear_categories_cubit/sports_wear_categories_cubit.dart';
import 'package:x_fitness/pressentaion/sportswear/sports_wear_repo.dart';
import 'package:x_fitness/pressentaion/video/manager/all_muscles_cubit/all_muscles_cubit.dart';
import 'package:x_fitness/pressentaion/video/manager/muscle_files_cubit/muscles_files_cubit.dart';
import 'package:x_fitness/pressentaion/video/muscles_repo.dart';
import 'package:x_fitness/simple_bloc_observer.dart';
import 'business logic/cubit/app_cubit/appcubit_cubit.dart';
import 'core/utils/service_locator.dart';
import 'package:http/http.dart' as http;

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
late AndroidDeviceInfo androidInfo;
late IosDeviceInfo iosInfo;
String osName = Platform.operatingSystem;
String model = "";
Location location = Location();
String locationInfo = 'Not available';
dynamic ipAddress;

void main() async {
  location = Location();
  WidgetsFlutterBinding.ensureInitialized();
  await startShared();
  await getLocale();
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String _oneSignalAppId = 'b139f7fd-a69f-45a8-95ab-25aa1f8bcb6f';

  @override
  void initState() {
    super.initState();
    intialplatformtate();
    Future.delayed(Duration(milliseconds: 500), () {
      initDeviceInfo();
      getLocation();
      getIpAddress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) =>
              CategoriesCubit(getIt.get<HomeRepo>())..getAllCategories(),
        ),
        BlocProvider(
          create: (context) =>
              AllEquipmentsCubit(getIt<EquipmentsRepo>())..getAllEquipments(),
        ),
        BlocProvider(
          create: (context) =>
              AllMusclesCubit(getIt<MusclesRepo>())..getAllMuscles(),
        ),
        BlocProvider(
          create: (context) => MusclesFilesCubit(getIt<MusclesRepo>()),
        ),
        BlocProvider(
          create: (context) =>
              EquipmentsCategoriesCubit(getIt<EquipmentsRepo>())
                ..getEquipmentsCategories(),
        ),
        BlocProvider(
          create: (context) => DetailedEquipmentCubit(getIt<EquipmentsRepo>()),
        ),
        BlocProvider(
          create: (context) => FilteredEquipmentsCubit(getIt<EquipmentsRepo>()),
        ),
        BlocProvider(
          create: (context) => AllAccessoriesCubit(getIt<AccessoriesRepo>())
            ..getAllAccessories(),
        ),
        BlocProvider(
          create: (context) => DetailedAccessoryCubit(getIt<AccessoriesRepo>()),
        ),
        BlocProvider(
          create: (context) =>
              AccessoriesCategoriesCubit(getIt<AccessoriesRepo>())
                ..getAccessoriesCategories(),
        ),
        BlocProvider(
          create: (context) => FilteredAccessoryCubit(getIt<AccessoriesRepo>()),
        ),
        BlocProvider(
          create: (context) =>
              AllSportsWearCubit(getIt<SportsWearRepo>())..getAllWears(),
        ),
        BlocProvider(
          create: (context) =>
              SportsWearCategoriesCubit(getIt<SportsWearRepo>())
                ..getWearsCategories(),
        ),
        BlocProvider(
          create: (context) => DetailedSportsWearCubit(getIt<SportsWearRepo>()),
        ),
        BlocProvider(
          create: (context) => FilteredSportsWearCubit(getIt<SportsWearRepo>()),
        ),
        BlocProvider(
          create: (context) =>
              AllDietFoodsCubit(getIt<DietFoodRepo>())..getAllFoods(),
        ),
        BlocProvider(
          create: (context) =>
              FoodsCategoriesCubit(getIt<DietFoodRepo>())..getFoodsCategories(),
        ),
        BlocProvider(
          create: (context) => DetailedDietFoodCubit(getIt<DietFoodRepo>()),
        ),
        BlocProvider(
          create: (context) => FilteredFoodsCubit(getIt<DietFoodRepo>()),
        ),
        BlocProvider(
          create: (context) => AllSupplementsCubit(getIt<SupplementsRepo>())
            ..getAllSupplements(),
        ),
        BlocProvider(
          create: (context) =>
              SupplementsCategoriesCubit(getIt<SupplementsRepo>())
                ..getSupplementsCategories(),
        ),
        BlocProvider(
          create: (context) =>
              DetailedSupplementCubit(getIt<SupplementsRepo>()),
        ),
        BlocProvider(
          create: (context) =>
              FilteredSupplementsCubit(getIt<SupplementsRepo>()),
        ),
        BlocProvider(
          create: (context) =>
              AllCoachesCubit(getIt<CoachesRepo>())..getAllCoaches(),
        ),
        BlocProvider(
          create: (context) => AllGymsCubit(getIt<GymsRepo>())..getAllGyms(),
        )
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return GetMaterialApp(
            locale: Locale(prefs.getString("lang") ?? "en"),
            supportedLocales: const [
              Locale('en', ''),
              Locale('ar', ''),
              Locale('ku_IQ', ''),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            home: child,
          );
        },
        child: const SplashScreen(),
      ),
    );
  }

  Future<void> getLocation() async {
    Location location = new Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        setState(() {
          locationInfo = 'Location: Service not enabled';
        });
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        setState(() {
          locationInfo = 'Location: Permission not granted';
        });
        return;
      }
    }

    LocationData locationData = await location.getLocation();
    setState(() {
      locationInfo = '${locationData.latitude}, ${locationData.longitude}';
      print("Location:${locationInfo}");
    });
  }

   getIpAddress() async {
    try {
       var data = IpAddress(type: RequestType.json);
       print("ipaddresss  ${data.type.name}");

       /// Get the IpAddress based on requestType.
      ipAddress = await data.getIpAddress();
      print("ipaddresss  ${ipAddress}");

    } catch (e) {
      setState(() {
        ipAddress = 'IP Address: Error fetching data';
      });
    }
  }

  Future<void> intialplatformtate() async {
    await OneSignal.shared.setAppId(_oneSignalAppId);
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      event.complete(event.notification);
    });
  }
}

Future<void> initDeviceInfo() async {
  try {
    deviceInfo = DeviceInfoPlugin();
    if (Get.context != null) {
      print("=-=-=-=-  ${Theme.of(Get.context!).platform}");
      print("=-=-deviceInfo=-=-  ${deviceInfo}");
      if (Theme.of(Get.context!).platform == TargetPlatform.iOS) {
        iosInfo = await deviceInfo.iosInfo;
        model = iosInfo.model;
        print('Running on iOS: ${iosInfo.utsname.machine}');
      } else {
        androidInfo = await deviceInfo.androidInfo;
        model = androidInfo.model;

        print('Running on Android: ${androidInfo.model}');
      }
    } else {
      print('Error: Get.context is null');
    }
  } catch (e) {
    print('Error getting device info: $e');
  }
}
