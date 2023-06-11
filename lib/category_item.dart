import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meals_app/model/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryInfo category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [category.color, category.color.withOpacity(0.8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft),
      ),
      child: Text(
        category.name,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );
  }
}
