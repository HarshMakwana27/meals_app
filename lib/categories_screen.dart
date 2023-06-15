import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import 'package:meals_app/data/category.dart';
import 'package:meals_app/data/meals.dart';
import 'package:meals_app/meal_screen.dart';
import 'package:meals_app/model/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, CategoryInfo category) {
    final filteredMeals =
        meals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(category, filteredMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Categories',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: GridView(
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
          ]),
    );
  }
}
