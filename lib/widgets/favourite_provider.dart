//import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/models/meals.dart';


class Favouritemealnotifier extends StateNotifier<List<Meal>>{
  Favouritemealnotifier(): super([]);
  bool toggleFavouriteStatus(Meal meal){
    final mealfavourite = state.contains(meal);
    if(mealfavourite){
      state= state.where((m)=> 
        m.id != meal.id 
      ).toList();
      return false;
    }
    else{
      state= [...state, meal];
      return true;
    }
  }
}

final favouritemealsProvider = StateNotifierProvider<Favouritemealnotifier, List<Meal>>((ref){
  return Favouritemealnotifier();
}); 