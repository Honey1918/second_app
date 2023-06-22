import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/widgets/provider_meals.dart';

enum Filters {
  glutenfree,
  vegan,
  vegetarian,
  lactosfree,
}

class Filtersnotifier extends StateNotifier<Map<Filters, bool>> {
  Filtersnotifier()
      : super({
          Filters.glutenfree: false,
          Filters.lactosfree: false,
          Filters.vegan: false,
          Filters.vegetarian: false,
        });
  void setFilter(Map<Filters, bool> chosenfilters){
    state= chosenfilters;
  }
  void isFilter(Filters filter, bool isAcitve) {
    state = {...state, filter: isAcitve};
  }
}

final filtersprovider =
    StateNotifierProvider<Filtersnotifier, Map<Filters, bool>>(
        (ref) => Filtersnotifier(),
    );

final filtermealsprovider= Provider((ref){
  final meals= ref.watch(mealprovider);
  final activemeals= ref.watch(filtersprovider);
  return meals.where((meal){
        if(activemeals[Filters.glutenfree]! && !meal.isGlutenFree){
          return false;
        }
        if(activemeals[Filters.lactosfree]! && !meal.isLactoseFree){
          return false;
        }
        if(activemeals[Filters.vegan]! && !meal.isVegan){
          return false;
        }
        if(activemeals[Filters.vegetarian]! && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
});