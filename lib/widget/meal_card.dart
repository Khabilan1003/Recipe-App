import "package:flutter/material.dart";
import "package:recipe_app/model/meal.dart";
import "package:recipe_app/screen/meal_detail_screen.dart";
import "package:recipe_app/widget/meal_meta_data.dart";
import "package:transparent_image/transparent_image.dart";

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MealDetailScreen(
                meal: meal,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(
                  meal.imageUrl,
                ),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Container(
            //   height: 200,
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(colors: [
            //       Colors.grey.withOpacity(0.65),
            //       Colors.grey.withOpacity(0.45)
            //     ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            //   ),
            //   width: double.infinity,
            // ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 44),
                color: Colors.black45,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealMetaData(
                            icon: Icons.schedule,
                            label: "${meal.duration} min"),
                        const SizedBox(
                          width: 16,
                        ),
                        MealMetaData(
                            icon: Icons.work,
                            label:
                                "${meal.complexity.name[0].toUpperCase()}${meal.complexity.name.substring(1)}"),
                        const SizedBox(
                          width: 16,
                        ),
                        MealMetaData(
                            icon: Icons.money_sharp,
                            label:
                                "${meal.affordability.name[0].toUpperCase()}${meal.affordability.name.substring(1)}")
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
