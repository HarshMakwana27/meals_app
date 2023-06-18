import 'package:flutter/material.dart';
import 'package:meals_app/model/category.dart';

class MealInfo extends StatelessWidget {
  const MealInfo({super.key, required this.meal, required this.toggleFav});

  final Meal meal;
  final void Function(Meal meal) toggleFav;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                toggleFav(meal);
              },
              icon: const Icon(
                Icons.favorite,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                for (final ingredient in meal.ingredients)
                  Text(
                    ingredient,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Steps',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                for (final step in meal.steps)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      step,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
