import 'package:flutter/material.dart';
import 'package:meals_app/data/meals.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/main_drawer.dart';
import 'package:meals_app/screens/meal_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  CategoryInfo favourite =
      CategoryInfo(id: 'fav', name: 'favourite', color: Colors.pink);
  int selectedPageIndex = 0;
  String? activePageTitle;
  List<Meal> favoritesList = [];

  Map<Filters, bool> selectedFilters = {
    Filters.lactoseFree: false,
    Filters.glutenFree: false,
    Filters.vegan: false,
    Filters.vegetarian: false,
  };

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleFavouriteMeal(Meal meal) {
    final isInList = favoritesList.contains(meal);

    isInList
        ? setState(() {
            favoritesList.remove(meal);
            _showInfoMessage('Meal Removed From Favourites');
          })
        : setState(() {
            favoritesList.add(meal);
            _showInfoMessage('Meal Added to Favourites');
          });
  }

  void _screenChange(String nextScreenName) async {
    Navigator.pop(context);
    if (nextScreenName == 'Filters') {
      var result = await Navigator.push<Map<Filters, bool>>(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  FilterScreen(currentFilters: selectedFilters)));

      setState(() {
        selectedFilters = result!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = meals.where((meal) {
      if (selectedFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      if (selectedFilters[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(_toggleFavouriteMeal, availableMeals);
    activePageTitle = 'Categories';

    if (selectedPageIndex == 1) {
      activePage = MealScreen(favourite, favoritesList, _toggleFavouriteMeal);
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
            : Theme.of(context).colorScheme.primary,
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
