import 'package:flutter/material.dart';
import 'package:recipe_app/model/meal.dart';
import 'package:recipe_app/provider/favourite_meals_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMealsProviderRef = ref.read(favouriteMealsProvider.notifier);

    final isFavourite = ref.watch(favouriteMealsProvider).contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              bool wasAdded =
                  favouriteMealsProviderRef.toggleFavouriteMeal(meal);
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAdded
                        ? "Meal added to favourite."
                        : "Meal removed from favourite",
                  ),
                ),
              );
            },
            icon: Icon(isFavourite ? Icons.star : Icons.star_border),
          )
        ],
      ),
      body: ListView(
        children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                meal.imageUrl,
              ),
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            "Ingredients",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.deepOrange,
            ),
            textAlign: TextAlign.center,
          ),
          for (final ingredient in meal.ingredients)
            Text(
              ingredient,
              textAlign: TextAlign.center,
            ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            "Steps",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.deepOrange,
            ),
            textAlign: TextAlign.center,
          ),
          for (final step in meal.steps)
            Text(
              step,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
