import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:recipe_app/data/meal_data.dart";

final mealsProvider = Provider((ref) => dummyMeals);