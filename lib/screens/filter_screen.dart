import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filters.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.glutenFree, isChecked);
            },
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
            value: activeFilters[Filters.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.lactoseFree, isChecked);
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
            value: activeFilters[Filters.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.vegan, isChecked);
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
            value: activeFilters[Filters.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.vegetarian, isChecked);
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
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
