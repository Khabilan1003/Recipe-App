import 'package:flutter/material.dart';
import 'package:recipe_app/provider/favourite_meals_provider.dart';
import 'package:recipe_app/provider/filter_provider.dart';
import 'package:recipe_app/screen/category_list_screen.dart';
import 'package:recipe_app/screen/filter_screen.dart';
import 'package:recipe_app/screen/meals_screen.dart';
import 'package:recipe_app/widget/main_drawer.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  String title = "Pick your category";

  int selectedIndex = 0;

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void drawerNavigation(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = CategoryListScreen(
      filteredMeals: ref.watch(filteredMealsProvider),
    );
    title = "Pick your category";

    if (selectedIndex == 1) {
      content = MealsScreen(meals: ref.watch(favouriteMealsProvider));
      title = "Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
      drawer: MainDrawer(
        drawerNavigation: drawerNavigation,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: changeIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
