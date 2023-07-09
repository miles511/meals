import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';
import '../models/meal.dart';
import '../widgets/meal_detail.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,  this.title,
  required this.meals,
    required this.onToggleFavorite
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetailsScreen(meal: meal, onToggleFavorite: onToggleFavorite, )));
  }

  @override
  Widget build(BuildContext context) {

    Widget content  = ListView.builder(itemBuilder: (context, index){
      return Text(meals[index].title);
    },
    itemCount: meals.length,
    );

    if (meals.isEmpty) {
      content = Center(child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh oh.....nothing here',
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme
                .of(context)
                .colorScheme
                .onBackground),
          ),
          const SizedBox(height: 10.0,),
          Text('Try selecting different category',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground)
          ),
        ],
      ));
    } else  {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(meal: meals[index], onSelectMeal: selectMeal ));
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
