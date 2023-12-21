import 'package:flutter/material.dart';
import 'package:recipe_app/data/category_data.dart';
import 'package:recipe_app/model/category.dart';
import 'package:recipe_app/model/meal.dart';
import 'package:recipe_app/screen/meals_screen.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key, required this.filteredMeals});

  final List<Meal> filteredMeals;

  void mealsPageNavigator(Category category, BuildContext ctx) {
    String id = category.id;
    List<Meal> meals = [];

    for (final meal in filteredMeals) {
      if (meal.categories.contains(id)) {
        meals.add(meal);
      }
    }

    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: meals,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2,
          ),
          children: [
            for (final category in availableCategories)
              InkWell(
                onTap: () {
                  mealsPageNavigator(category, context);
                },
                splashColor: category.color,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          category.color.withOpacity(0.9),
                          category.color.withOpacity(0.65)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    category.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
          ],
        ));
  }
}
