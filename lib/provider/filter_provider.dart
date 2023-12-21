import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:recipe_app/model/meal.dart";
import "package:recipe_app/provider/meals_provider.dart";

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });

  void updateFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void updateFilter(Filter filter, bool value) {
    state = {...state, filter: value};
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
  (ref) => FilterNotifier(),
);

final filteredMealsProvider = Provider((ref) {
  final List<Meal> meals = ref.watch(mealsProvider);
  final Map<Filter, bool> filters = ref.watch(filterProvider);

  return meals.where((meal) {
    if (filters[Filter.glutenFree]! && !meal.isGlutenFree) return false;
    if (filters[Filter.lactoseFree]! && !meal.isLactoseFree) return false;
    if (filters[Filter.vegan]! && !meal.isVegan) return false;
    if (filters[Filter.vegetarian]! && !meal.isVegetarian) return false;
    return true;
  }).toList();
});
