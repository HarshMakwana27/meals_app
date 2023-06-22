import 'package:flutter/material.dart';

import 'package:meals_app/model/category.dart';
import 'package:meals_app/providers/favourites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/main_drawer.dart';
import 'package:meals_app/screens/meal_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  CategoryInfo favourite =
      CategoryInfo(id: 'fav', name: 'favourite', color: Colors.pink);
  int selectedPageIndex = 0;
  String? activePageTitle;
  List<Meal> favoritesList = [];

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void _screenChange(String nextScreenName) {
    Navigator.pop(context);
    if (nextScreenName == 'Filters') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const FilterScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);
    Widget activePage = CategoriesScreen(availableMeals);
    activePageTitle = 'Categories';

    if (selectedPageIndex == 1) {
      final favMeals = ref.watch(favouriteMealsProvider);
      activePage = MealScreen(favourite, favMeals);
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle!,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(),
        ),
        backgroundColor: selectedPageIndex == 0
            ? Theme.of(context).colorScheme.background
            : favourite.color,
      ),
      body: activePage,
      drawer: MainDrawer(screenChange: _screenChange),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor:
            Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
