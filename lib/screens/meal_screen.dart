import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_info.dart';

import 'package:meals_app/widgets/meal_item.dart';
import 'package:meals_app/model/category.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(this.category, this.categorizedMeals, {super.key});

  final CategoryInfo category;
  final List<Meal> categorizedMeals;

  void _getMealInfo(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealInfo(
          meal: meal,
        ),
      ),
    );
  }

  bool isFav() {
    return category.name == 'favourite';
  }

  @override
  Widget build(BuildContext context) {
    return isFav()
        ? Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Container(
              child: categorizedMeals.isEmpty
                  ? Center(
                      child: Text('Oops....Nothing to see here ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                          )),
                    )
                  : ListView.builder(
                      itemCount: categorizedMeals.length,
                      itemBuilder: ((ctx, index) => MealItem(
                            meal: categorizedMeals[index],
                            getMealInfo: () {
                              _getMealInfo(context, categorizedMeals[index]);
                            },
                          )),
                    ),
            ),
          )
        : Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: Text(category.name),
              backgroundColor: category.color,
            ),
            body: Container(
              child: categorizedMeals.isEmpty
                  ? const Center(
                      child: Text('Oops....Nothing to see here '),
                    )
                  : ListView.builder(
                      itemCount: categorizedMeals.length,
                      itemBuilder: ((ctx, index) => MealItem(
                            meal: categorizedMeals[index],
                            getMealInfo: () {
                              _getMealInfo(context, categorizedMeals[index]);
                            },
                          )),
                    ),
            ),
          );
  }
}
