import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_dart.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/models/meals.dart';
import 'package:mealapp/screen/mealsscreen.dart';
import 'package:mealapp/widgets/category_griditem.dart';

class Categoriesscreen extends StatefulWidget {
  const Categoriesscreen({super.key, required this.availablemeals});

  final List<Meal> availablemeals;

  @override
  State<Categoriesscreen> createState() => _CategoriesscreenState();
}

class _CategoriesscreenState extends State<Categoriesscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationcontroller;

  @override
  void initState() {
    super.initState();
    _animationcontroller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationcontroller.forward();
  }

  @override
  void dispose() {
    _animationcontroller.dispose();
    super.dispose();
  }

  void _selectedCategory(BuildContext context, Category category) {
    final mealslist = widget.availablemeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Mealsscreen(
              meal: mealslist,
              title: category.title,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationcontroller,
        child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            //availableCategories.map(category)(=> Categorygrid(category: category)),
            for (final category in availableCategories)
              Categorygrid(
                category: category,
                onSelectcategory: () {
                  _selectedCategory(context, category);
                },
              ),
          ],
        ),
        builder: (context, child) => SlideTransition(
              position: _animationcontroller.drive(
                Tween(
                  begin: const Offset(0, 0.3),
                  end: const Offset(0, 0),
                )
              ),
              child: child,
            ));
  }
}
