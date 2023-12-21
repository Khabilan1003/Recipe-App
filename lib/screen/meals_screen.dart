import "package:flutter/material.dart";
import "package:recipe_app/model/meal.dart";
import "package:recipe_app/widget/meal_card.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

// ignore: must_be_immutable
class MealsScreen extends ConsumerWidget {
  MealsScreen({
    super.key,
    required this.meals,
    this.title,
  });

  final List<Meal> meals;
  String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = const Placeholder();

    content = meals.isNotEmpty
        ? ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) {
              return MealCard(
                meal: meals[index],
              );
            },
          )
        : const Center(
            child: Text(
              "Empty now. Recipes on the way.",
              style: TextStyle(fontSize: 20),
            ),
          );

    if (title == null) {
      return content;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      );
    }
  }
}
