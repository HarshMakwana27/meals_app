import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/theme_provider.dart';

class MainDrawer extends ConsumerStatefulWidget {
  const MainDrawer({super.key, required this.screenChange});

  final void Function(String nextScreenName) screenChange;
  @override
  ConsumerState<MainDrawer> createState() {
    return _MainDrawerScreen();
  }
}

class _MainDrawerScreen extends ConsumerState<MainDrawer> {
  bool? _isDarkMode;

  @override
  Widget build(BuildContext context) {
    var currentThemeBack = Theme.of(context).colorScheme.background;

    if (currentThemeBack == Colors.black) {
      _isDarkMode = true;
    }

    if (currentThemeBack == Colors.white) {
      _isDarkMode = false;
    }

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
                  size: 85,
                  color: Theme.of(context).colorScheme.background,
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border(bottom: BorderSide(width: 2))),
                  child: Text(
                    'Hungry',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'U',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 45,
                    backgroundColor: Theme.of(context).colorScheme.primary,
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
              widget.screenChange('Filters');
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
              widget.screenChange('Meals');
            },
          ),
          SwitchListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            value: _isDarkMode!,
            onChanged: (isChecked) {
              setState(() {
                _isDarkMode = isChecked;
                ref.read(themeProvider.notifier).isDarkMode(_isDarkMode!);
              });
            },
            // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

            title: Row(
              children: [
                Icon(
                  Icons.brightness_6,
                  color: Theme.of(context).colorScheme.primary,
                  size: 30,
                ),
                const SizedBox(
                  width: 25,
                ),
                Text('Dark Theme',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
              ],
            ),
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
