import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mealapp/models/tabs.dart';
// import 'package:mealapp/widgets/sidebar.dart';
import 'package:mealapp/widgets/filters_provider.dart';

class Filterscreen extends ConsumerWidget {
  const Filterscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilters= ref.watch(filtersprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body:Column(
          children: [
            SwitchListTile(
              value: activefilters[Filters.glutenfree]!,
              onChanged: (ischecked) {
                ref.read(filtersprovider.notifier).isFilter(Filters.glutenfree, ischecked);
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Gluten-free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activefilters[Filters.vegetarian]!,
              onChanged: (ischecked) {
                ref.read(filtersprovider.notifier).isFilter(Filters.vegetarian, ischecked);
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Vegetarian meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activefilters[Filters.lactosfree]!,
              onChanged: (ischecked) {
                ref.read(filtersprovider.notifier).isFilter(Filters.lactosfree, ischecked);
              },
              title: Text(
                'Lactos-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Lactos-free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activefilters[Filters.vegan]!,
              onChanged: (ischecked) {
                ref.read(filtersprovider.notifier).isFilter(Filters.vegan, ischecked);
              },
              title: Text(
                'Vegan',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Vegan meals',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
      ),
    );
  }
}
