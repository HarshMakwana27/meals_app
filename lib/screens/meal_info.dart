import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/providers/favourites_provider.dart';

bool isFav = false;

class MealInfo extends ConsumerStatefulWidget {
  const MealInfo({super.key, required this.meal});

  final Meal meal;

  @override
  ConsumerState<MealInfo> createState() {
    return _MealInfoState();
  }
}

class _MealInfoState extends ConsumerState<MealInfo> {
  @override
  Widget build(BuildContext context) {
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
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
              isFav = ref
                  .read(favouriteMealsProvider.notifier)
                  .toggleFavStatus(widget.meal);

              showInfoMessage(isFav);
            },
            icon: isFav
                ? const Icon(
                    Icons.favorite,
                  )
                : const Icon(
                    Icons.favorite_border_outlined,
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.meal.imageUrl,
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
                for (final ingredient in widget.meal.ingredients)
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
                for (final step in widget.meal.steps)
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
