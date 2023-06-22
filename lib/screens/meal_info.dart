import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/providers/favourites_provider.dart';

bool isFav = false;

class MealInfo extends ConsumerWidget {
  const MealInfo({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(favouriteMealsProvider);
    void showInfoMessage(bool isTrue) {
      final String message;

      isTrue
          ? message = 'Item Added To Favourites'
          : message = 'Item Removed from Favourites';
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              isFav = ref
                  .watch(favouriteMealsProvider.notifier)
                  .toggleFavStatus(meal);

              showInfoMessage(isFav);
            },
            icon: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: Tween(begin: 0.5, end: 1.0).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isFav ? Icons.favorite : Icons.favorite_border_outlined,
                key: ValueKey(isFav),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
              ),
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
