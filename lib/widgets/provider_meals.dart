import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/data/dummy_dart.dart';

final mealprovider= Provider((ref) {
  return dummyMeals;
});