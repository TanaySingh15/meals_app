import 'package:flutter/material.dart';
import '../Model/meal.dart';
import '../Widget/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text("Nothing To Show"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: favouriteMeals[index].id,
              affordability: favouriteMeals[index].affordability,
              complexity: favouriteMeals[index].complexity,
              duration: favouriteMeals[index].duration,
              imageUrl: favouriteMeals[index].imageUrl,
              title: favouriteMeals[index].title);
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
