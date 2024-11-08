import 'package:flutter/material.dart';
import 'package:meals/components/custom_app_bar.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/category.dart';
import '../data/dummy_data.dart';
import '../components/category_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments
        as Category; // forma de receber o contexto da tela anterior sem precisar passar parametros
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
        appBar: customAppBar(context, category.title),
        body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index){
            return MealItem(categoryMeals[index]);
          },
        ));
  }
}
