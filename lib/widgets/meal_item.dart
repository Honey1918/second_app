import 'package:flutter/material.dart';
import 'package:mealapp/models/meals.dart';
import 'package:mealapp/widgets/mealitemtrait.dart';
import 'package:transparent_image/transparent_image.dart';

class Mealitem extends StatelessWidget {
  const Mealitem({super.key, required this.meal ,required this.onSelectmeal});
  final Meal meal;

  final Function( Meal meal) onSelectmeal; 

  String get complexitymeal {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilitymeal {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior:
          Clip.hardEdge, //to force the stack to allow to change in shape
      elevation: 3,
      child: InkWell(
        onTap: () {onSelectmeal(meal);},
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover, //to ensure image is not distorted
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Mealitemtrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),                       
                            const SizedBox(width: 12,),
                        Mealitemtrait(
                            icon: Icons.work,
                            label: complexitymeal),
                            const SizedBox(width: 12,),
                         Mealitemtrait(
                            icon: Icons.attach_money_sharp,
                            label: affordabilitymeal),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
