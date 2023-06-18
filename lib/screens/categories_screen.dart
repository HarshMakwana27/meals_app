import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/data/category.dart';

import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/model/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(this.toggleFav, this.availableMeals, {super.key});

  final List<Meal> availableMeals;
  final void Function(Meal meal) toggleFav;
  void _selectCategory(BuildContext context, CategoryInfo category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(category, filteredMeals, toggleFav),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in categories)
            CategoryItem(
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
                category: category),
        ]);
  }
}
