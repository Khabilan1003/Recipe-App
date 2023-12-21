import 'package:flutter/material.dart';
import 'package:recipe_app/provider/filter_provider.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterProviderRef = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: filterProviderRef[Filter.glutenFree]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .updateFilter(Filter.glutenFree, value);
            },
            title: const Text("Gluten Free"),
            subtitle: const Text("Only include Gluten-free meals"),
          ),
          SwitchListTile(
            value: filterProviderRef[Filter.vegan]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .updateFilter(Filter.vegan, value);
            },
            title: const Text("Vegan"),
            subtitle: const Text("Only include Vegan meals"),
          ),
          SwitchListTile(
            value: filterProviderRef[Filter.lactoseFree]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .updateFilter(Filter.lactoseFree, value);
            },
            title: const Text("Lactose Free"),
            subtitle: const Text("Only include Lactose meals"),
          ),
          SwitchListTile(
            value: filterProviderRef[Filter.vegetarian]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .updateFilter(Filter.vegetarian, value);
            },
            title: const Text("Vegetarian"),
            subtitle: const Text("Only include Vegetarian meals"),
          )
        ],
      ),
    );
  }
}
