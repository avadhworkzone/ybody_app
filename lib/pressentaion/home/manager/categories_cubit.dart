import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_fitness/models/categories/category_model.dart';
import 'package:x_fitness/pressentaion/Accessories/Accessoriesscreen.dart';
import 'package:x_fitness/pressentaion/Coaches/CoachesScreen.dart';
import 'package:x_fitness/pressentaion/DietFood/screens/diet_food_screen.dart';
import 'package:x_fitness/pressentaion/GymDiscounts/screens/gym_discont.dart';
import 'package:x_fitness/pressentaion/Supplements/supplements_screen.dart';
import 'package:x_fitness/pressentaion/equilpemnet/screens/Equipments.dart';
import 'package:x_fitness/pressentaion/home/home_repo.dart';
import 'package:x_fitness/pressentaion/sportswear/sports_wear.dart';
import 'package:x_fitness/pressentaion/video/video_screen.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  final HomeRepo homeRepo;
  late int id;
  final List<Widget> categoriesViews = [
    EquipmentsScreen(),
    AccessoriesScreen(),
    SportsWearScreen(),
    DietFoodScreen(),
    CoachesScreen(),
    SupplementsScreen(),
    GymDiscountScreen(),
    VideoScreen(),
  ];

  Future<void> getAllCategories() async {
    emit(CategoriesLoading());
    var result = await homeRepo.getAllCategories();
    result.fold((failure) => emit(CategoriesFailure(failure.errorMessage)),
        (categories) => emit(CategoriesSuccess(categories, categoriesViews)));
  }
}
