import 'package:flutter/material.dart';
import 'package:meals_app/Widget/meal_item.dart';
//import 'package:meals_app/dummy_data.dart';
import '../Model/meal.dart';

class CategoriesMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoriesMealsScreen(this.categoryId, this.categoryTitle);

  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoriesMealsScreen(this.availableMeals);

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    final categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: categoryMeals[index].id,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
