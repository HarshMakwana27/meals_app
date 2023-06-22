import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_data_info.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/model/category.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.getMealInfo});

  final Meal meal;
  final void Function() getMealInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: getMealInfo,
        child: Stack(children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
              child: Column(
                children: [
                  Text(
                    meal.title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MealDataInfo(
                    time: meal.duration,
                    complexity: meal.complexity.name,
                    affordability: meal.affordability.name,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
