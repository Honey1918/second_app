import 'package:flutter/material.dart';
//import 'package:mealapp/data/dummy_dart.dart';
import 'package:mealapp/models/meals.dart';
import 'package:mealapp/screen/details.dart';
import 'package:mealapp/widgets/meal_item.dart';

class Mealsscreen extends StatelessWidget {
  const Mealsscreen(
      {super.key,
      required this.meal,
      this.title,});

  final String? title;
  final List<Meal> meal;

  void _selectedmeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Imagescreen(
              meal: meal,
            ),),);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh....nothing here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Try selecting a different category',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    if (meal.isNotEmpty) {
      content = ListView.builder(
        itemCount: meal.length,
        itemBuilder: (ctx, index) => Mealitem(
          meal: meal[index],
          onSelectmeal: (meal) {
            _selectedmeal(context, meal);
          },
        ),
      );
    }
    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
