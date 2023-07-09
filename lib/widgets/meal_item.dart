import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  final Meal meal;
  final void Function(BuildContext context, Meal meal) onSelectMeal;

  String get complexityText{
    return meal.complexity.name[0].toUpperCase() +  meal.complexity.name.substring(1) ;
  }

  String get affordableText{
    return meal.affordability.name[0].toUpperCase() +  meal.affordability.name.substring(1) ;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: InkWell(
      onTap: () {
        onSelectMeal(context, meal);
      },
      child: Stack(
        children: [
          FadeInImage(placeholder: MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl),),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:  Container(
              padding: const  EdgeInsets.symmetric(vertical: 5, horizontal: 44),
              color: Colors.black54,
              child: Column(
                children: [
                  Text(meal.title,
                  maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        MealItemTreat(icon: Icons.schedule, label: '${meal.duration} min'),
                      const SizedBox(width: 10,),
                      MealItemTreat(icon: Icons.work, label: '$complexityText min'),
                      const SizedBox(width: 10,),
                      const MealItemTreat(icon: Icons.attach_money, label: 'affordableText '),


                    ],

                  )
                ],
              )
            ),)
        ],
      ),
    ),);
  }
}
