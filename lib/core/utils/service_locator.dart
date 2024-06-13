
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:x_fitness/pressentaion/Accessories/accessories_repo.dart';
import 'package:x_fitness/pressentaion/Coaches/coach_repo.dart';
import 'package:x_fitness/pressentaion/DietFood/diet_food_repo.dart';
import 'package:x_fitness/pressentaion/Supplements/supplements_repo.dart';
import 'package:x_fitness/pressentaion/equilpemnet/equimpments_repo.dart';
import 'package:x_fitness/pressentaion/home/home_repo.dart';
import 'package:x_fitness/pressentaion/sportswear/sports_wear_repo.dart';
import 'package:x_fitness/pressentaion/video/muscles_repo.dart';
import '../../pressentaion/GymDiscounts/gyms_repo.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepo>(
    HomeRepo(
      ApiService(
        createAndSetupDio(),
      ),
    ),
  );
  getIt.registerSingleton<EquipmentsRepo>(
    EquipmentsRepo(
      ApiService(
        createAndSetupDio(),
      ),
    ),
  );
  getIt.registerSingleton<MusclesRepo>(
    MusclesRepo(
      ApiService(
        createAndSetupDio(),
      ),
    ),
  );
  getIt.registerSingleton<AccessoriesRepo>(
    AccessoriesRepo(
      ApiService(
        createAndSetupDio(),
      ),
    ),
  );
  getIt.registerSingleton<SportsWearRepo>(
    SportsWearRepo(
      ApiService(
        createAndSetupDio(),
      ),
    ),
  );
  getIt.registerSingleton<DietFoodRepo>(
    DietFoodRepo(
      ApiService(
        createAndSetupDio(),
      ),
    ),
  );
  getIt.registerSingleton<SupplementsRepo>(
    SupplementsRepo(
      ApiService(
        createAndSetupDio(),
      ),
    ),
  );
  getIt.registerSingleton<CoachesRepo>(
    CoachesRepo(
      ApiService(
        createAndSetupDio(),
      ),
    ),
  );
  getIt.registerSingleton<GymsRepo>(
    GymsRepo(
      ApiService(
        createAndSetupDio(),
      ),
    ),
  );
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = const Duration(seconds: 20)
    ..options.receiveTimeout = const Duration(seconds: 20);

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}

