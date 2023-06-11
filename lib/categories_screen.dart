import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import 'package:meals_app/data/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Categories',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
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
            for (final category in categories) CategoryItem(category: category)
          ]),
    );
  }
}
