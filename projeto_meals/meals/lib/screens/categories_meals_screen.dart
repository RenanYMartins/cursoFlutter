import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key });


  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category; // forma de receber o contexto da tela anterior sem precisar passar parametros
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          category.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold, 
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Text("Receitas por categoria ${category.id}"),
      )
    );
  }
}