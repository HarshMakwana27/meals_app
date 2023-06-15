import 'package:flutter/material.dart';

import 'package:meals_app/meal_item.dart';
import 'package:meals_app/model/category.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(this.category, this.categorizedMeals, {super.key});

  final CategoryInfo category;

  final List<Meal> categorizedMeals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                itemBuilder: ((ctx, index) =>
                    MealItem(meal: categorizedMeals[index])),
              ),
      ),
    );
  }
}
