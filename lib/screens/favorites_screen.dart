import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You\'ve no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            id: favoriteMeals[idx].id,
            title: favoriteMeals[idx].title,
            imageUrl: favoriteMeals[idx].imageUrl,
            duration: favoriteMeals[idx].duration,
            complexity: favoriteMeals[idx].complexity,
            affordability: favoriteMeals[idx].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
