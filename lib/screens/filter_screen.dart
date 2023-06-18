import 'package:flutter/material.dart';

enum Filters { glutenFree, lactoseFree, vegan, vegetarian }

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filters, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFilters[Filters.glutenFree]!;
    _isLactoseFree = widget.currentFilters[Filters.lactoseFree]!;
    _isVegan = widget.currentFilters[Filters.vegan]!;
    _isVegetarian = widget.currentFilters[Filters.vegetarian]!;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filters.glutenFree: _isGlutenFree,
            Filters.lactoseFree: _isLactoseFree,
            Filters.vegan: _isVegan,
            Filters.vegetarian: _isVegetarian,
          });

          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _isGlutenFree,
              onChanged: (isChecked) {
                setState(() {
                  _isGlutenFree = isChecked;
                });
              },
              // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              title: Text(
                'Gluten-Free !',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Select Gluten free meal',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 13,
                ),
              ),
            ),
            SwitchListTile(
              value: _isLactoseFree,
              onChanged: (isChecked) {
                setState(() {
                  _isLactoseFree = isChecked;
                });
              },
              // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              title: Text(
                'Lactose-Free !',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Select Lactose free meal',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 13,
                ),
              ),
            ),
            SwitchListTile(
              value: _isVegan,
              onChanged: (isChecked) {
                setState(() {
                  _isVegan = isChecked;
                  if (_isVegan) {
                    _isVegetarian = true;
                  }
                });
              },
              // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              title: Text(
                'Are you a Vegan !',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Select vegan food',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 13,
                ),
              ),
              activeColor: Colors.lightGreen,
              inactiveTrackColor: Colors.red,
              inactiveThumbColor:
                  Theme.of(context).colorScheme.error.withOpacity(0.5),
            ),
            SwitchListTile(
              value: _isVegetarian,
              onChanged: (isChecked) {
                setState(() {
                  _isVegetarian = isChecked;
                  if (!_isVegetarian) {
                    _isVegan = false;
                  }
                });
              },
              // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              title: Text(
                'Vegetarian !',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Select vegetarian food',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 13,
                ),
              ),

              activeColor: Colors.lightGreen,
              inactiveTrackColor: Colors.red,
              inactiveThumbColor:
                  Theme.of(context).colorScheme.error.withOpacity(0.5),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
