import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.screenChange});

  final void Function(String nextScreenName) screenChange;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            //padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  // ignore: unrelated_type_equality_checks
                  ThemeData.dark() == true
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.7)
                      : Theme.of(context).colorScheme.primary,
                ],
                end: Alignment.bottomRight,
                begin: Alignment.topLeft,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 70,
                  color: Theme.of(context).colorScheme.background,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Hungry Birds',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            leading: Icon(
              Icons.favorite_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 30,
            ),
            horizontalTitleGap: 25,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            title: Text('Filters',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
            onTap: () {
              screenChange('Filters');
            },
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            leading: Icon(
              Icons.restaurant_menu,
              color: Theme.of(context).colorScheme.primary,
              size: 30,
            ),
            horizontalTitleGap: 25,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(1))),
            title: Text('Meals',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
            onTap: () {
              screenChange('Meals');
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Made with ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 10,
                  ),
                ),
                const Icon(
                  Icons.favorite_sharp,
                  color: Colors.red,
                  size: 15,
                ),
                Text(
                  ' By Harsh Makwana',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
