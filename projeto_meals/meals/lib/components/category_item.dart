import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import '../utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final Category category;

  void _selectCategory(BuildContext context) {
    // navegacao via push
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) {
    //     return CategoriesMealsScreen(category: category);
    //   }),
    // );

    // navegacao via rota nomeada
    Navigator.of(context).pushNamed(AppRoutes.categoriesMeals, arguments: category);

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // InkWell precisa ter definido qual eh a area clicavel pelo usuario, podendo ou nao envolver o container todo nesse caso
      splashColor: Theme.of(context).primaryColor,
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(
          15), // area clicavel igual ao do container envolvido
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.5),
                category.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
