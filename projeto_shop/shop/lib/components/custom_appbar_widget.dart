import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/badgee.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

enum FilterOptions { favorite, all }

AppBar customAppBar(BuildContext context, String title) {
  final provider = Provider.of<ProductList>(context);
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      PopupMenuButton(
        icon: const Icon(Icons.more_horiz),
        position: PopupMenuPosition.under,
        iconColor: Colors.white,
        itemBuilder: (_) => [
          const PopupMenuItem(
            value: FilterOptions.favorite,
            child: Text('Somente Favoritos'),
          ),
          const PopupMenuItem(
            value: FilterOptions.all,
            child: Text('Todos'),
          ),
        ],
        onSelected: (FilterOptions selectedValue) {
          if (selectedValue == FilterOptions.favorite) {
            provider.showFavoriteOnly();
          } else {
            provider.showAll();
          }
        },
      ),
      Consumer<Cart>(
        child: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.cart);
          },
          icon: const Icon(Icons.shopping_cart),
        ),
        builder: (context, cart, child) => Badgee(
          value: cart.itemsCount.toString(),
          child: child!,
        ),
      ),
    ],
    backgroundColor: Theme.of(context).colorScheme.primary,
  );
}
