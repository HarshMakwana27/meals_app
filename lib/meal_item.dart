import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/model/category.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(children: [
          FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl)),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 44),
              child: Text(
                meal.title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                textAlign: TextAlign.center,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
