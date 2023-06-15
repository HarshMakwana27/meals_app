import 'package:flutter/material.dart';

class MealDataInfo extends StatelessWidget {
  const MealDataInfo(
      {required this.time,
      required this.affordability,
      required this.complexity,
      super.key});

  final int time;
  final String affordability;
  final String complexity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.schedule,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text('${time.toString()} mins',
            style: const TextStyle(color: Colors.white)),
        const SizedBox(width: 15),
        const Icon(
          Icons.work,
          color: Colors.white,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(complexity, style: const TextStyle(color: Colors.white)),
        const SizedBox(width: 15),
        const Icon(
          Icons.currency_rupee,
          color: Colors.white,
          size: 20,
        ),
        Text(affordability, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
